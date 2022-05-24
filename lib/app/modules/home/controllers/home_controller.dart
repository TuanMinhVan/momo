import 'package:get/get.dart';

class CategoryItem {
  CategoryItem(this.title, this.icon);
  final String icon, title;
}

class HomeController extends GetxController {
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
}
