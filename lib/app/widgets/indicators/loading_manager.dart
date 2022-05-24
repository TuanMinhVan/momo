import 'package:flutter/material.dart';

import 'loading.dart';

class LoadingManager {
  factory LoadingManager() => _instance;

  LoadingManager._();

  static final LoadingManager _instance = LoadingManager._();

  static int showCount = 0;

  static void show(BuildContext context) {
    try {
      if (showCount == 0) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => WillPopScope(
              onWillPop: () {
                return Future.value(false);
              },
              child: const Center(child: Loading())),
        );
      }
      showCount++;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static void hide(BuildContext context) {
    if (showCount >= 1) {
      showCount--;
      if (showCount == 0) {
        Navigator.pop(context);
      }
    } else if (showCount < 1) {
      return;
    }
  }
}
