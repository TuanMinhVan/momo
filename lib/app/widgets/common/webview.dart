import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

class WebViewPicker {
  factory WebViewPicker() => _instance;
  WebViewPicker._internal();
  static final WebViewPicker _instance = WebViewPicker._internal();

  static void show(
    BuildContext context,
    String url, {
    JavascriptMode? javascriptMode,
    String? title,
    callbackUrl,
    bool gestureNavigationEnabled = true,
    clearCookie = false,
    showAppBar = true,
    PreferredSizeWidget? appBar,
  }) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => WebViewPage(
          url: url,
          javascriptMode: javascriptMode ?? JavascriptMode.unrestricted,
          title: title,
          callbackUrl: callbackUrl,
          clearCookie: clearCookie,
          gestureNavigationEnabled: gestureNavigationEnabled,
          showAppBar: showAppBar,
          appBar: appBar,
        ),
      ),
    );
  }
}

class WebViewPage extends StatefulWidget {
  const WebViewPage({
    Key? key,
    required this.url,
    this.callbackUrl,
    this.title,
    this.javascriptMode = JavascriptMode.unrestricted,
    this.gestureNavigationEnabled = true,
    this.clearCookie = false,
    this.showAppBar = true,
    this.appBar,
  }) : super(key: key);
  final String url;
  final String? callbackUrl;
  final String? title;
  final JavascriptMode javascriptMode;
  final bool gestureNavigationEnabled;
  final bool clearCookie;
  final PreferredSizeWidget? appBar;
  final bool showAppBar;
  @override
  _WebViewPageState createState() {
    return _WebViewPageState();
  }
}

class _WebViewPageState extends State<WebViewPage> {
  var isLoading = ValueNotifier(true);
  final cookieManager = CookieManager();

  bool callbackSuccess = false;
  String? callbackUrl;
  WebViewController? controller;

  @override
  void initState() {
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
    super.initState();
  }

  @override
  void didUpdateWidget(WebViewPage oldWidget) {
    if (oldWidget.url != widget.url) {
      var url = widget.url;
      if (!widget.url.contains('http')) {
        url = 'https://\$url';
      }
      controller?.loadUrl(url);
    }
    super.didUpdateWidget(oldWidget);
  }

  ///Clear Cookie
  Future<void> clearCookie() async {
    if (Platform.isIOS) {
      await controller?.clearCache();
    } else {
      await cookieManager.clearCookies();
    }
  }

  Future<void> onPageFinished(BuildContext context, String url) async {
    if (callbackUrl != null && !callbackSuccess) {
      if (widget.clearCookie) {
        await clearCookie();
      }
      callbackSuccess = true;
      Navigator.pop(context, callbackUrl);
    }
  }

  Widget buildWebView() {
    return WebView(
      initialUrl: widget.url,
      javascriptMode: widget.javascriptMode,
      onWebViewCreated: (WebViewController webViewController) {
        controller = webViewController;
      },
      onProgress: (int i) {
        if (i == 100) {
          isLoading.value = false;
        }
      },
      onPageStarted: (String url) {},
      onPageFinished: (String url) {
        onPageFinished(context, url);
      },
      navigationDelegate: (NavigationRequest request) {
        final callback = widget.callbackUrl;
        if (callback != null && request.url.startsWith(callback)) {
          callbackUrl = request.url;
        }
        return NavigationDecision.navigate;
      },
      gestureNavigationEnabled: widget.gestureNavigationEnabled,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.showAppBar
          ? widget.appBar ?? AppBar(title: Text(widget.title ?? widget.url))
          : null,
      body: SafeArea(
        child: Stack(
          children: [
            RepaintBoundary(child: buildWebView()),
            Positioned.fill(
              child: ValueListenableBuilder(
                valueListenable: isLoading,
                builder: (context, bool value, _) {
                  if (value) {
                    return Center(
                      child: Platform.isAndroid
                          ? const CircularProgressIndicator()
                          : const CupertinoActivityIndicator(),
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
