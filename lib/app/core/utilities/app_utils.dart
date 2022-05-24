import 'dart:developer' as developer;
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'utilities.dart';

class AppUtils {
  factory AppUtils() => _instance;
  AppUtils._internal();

  static final AppUtils _instance = AppUtils._internal();
  static void log(dynamic msg, {String? tag}) {
    if (kDebugMode) {
      developer.log(msg.toString(), name: tag ?? AppConfig.instance.appName);
    }
  }

  static void toast(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: const Color(0xFF1E1E1E).withOpacity(0.95),
      textColor: Colors.white,
    );
  }

  static Size textSize(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style),
        maxLines: 1,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }

  static void internetLookUp() async {
    try {
      await InternetAddress.lookup('google.com').catchError((e) {
        toast('No internet connection ${e.toString()}');
      });
    } catch (err) {
      toast('No internet connection. ${err.toString()}');
    }
  }
}
