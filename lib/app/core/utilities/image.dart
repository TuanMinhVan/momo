import 'dart:core';

class AppImage {
  factory AppImage() => _instance;

  AppImage._internal();
  static final AppImage _instance = AppImage._internal();
  static const String momo = 'assets/icons/momo.png';
  static const String jaFlag = 'assets/flag/ja.png';
  static const String enFlag = 'assets/flag/en.png';
  static const String koFlag = 'assets/flag/ko.png';
  static const String home = 'assets/navigator/home.svg';
  static const String notification = 'assets/navigator/notification.svg';
  static const String search = 'assets/navigator/search.svg';
  static const String user = 'assets/navigator/user.svg';
  static const String banner = 'assets/images/banner.png';
  static const String momoLearning = 'assets/images/momo_learning.png';
}
