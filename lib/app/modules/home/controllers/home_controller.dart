import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryItem {
  CategoryItem(this.title, this.icon);
  final String icon, title;
}

class HomeController extends GetxController {
  late ScrollController scrollController;
  final categoryTab = 0.obs;

  final categories = <CategoryItem>[
    CategoryItem('Leave Balance', 'assets/icons/calendar.png'),
    CategoryItem('My Appraisal', 'assets/icons/check.png'),
    CategoryItem('My Payslip', 'assets/icons/payslip.png'),
    CategoryItem('My Performance', 'assets/icons/chart.png'),
    CategoryItem('E-Learning', 'assets/icons/learning.png'),
    CategoryItem('Find Support', 'assets/icons/find_support.png'),
    CategoryItem('Meeting Room', 'assets/icons/room.png'),
    CategoryItem('Overtime', 'assets/icons/time.png'),
  ];

  @override
  void onInit() {
    scrollController = ScrollController()..addListener(listenerScroll);
    super.onInit();
  }

  listenerScroll() {
    final maxScrollExtent = scrollController.position.maxScrollExtent;
    if (scrollController.position.pixels <= maxScrollExtent / 2) {
      categoryTab(0);
    } else {
      categoryTab(1);
    }
  }

  jumToPage(int index) {
    final maxScrollExtent = scrollController.position.maxScrollExtent;
    final first = maxScrollExtent / 2;
    if (index == 0) {
      scrollController.jumpTo(0);
    } else {
      scrollController.jumpTo(first + (first / 2));
    }
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
