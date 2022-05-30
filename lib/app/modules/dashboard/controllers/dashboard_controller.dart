import 'package:get/get.dart';

import '../../../core/styles/style.dart';
import '../../../core/utilities/image.dart';

class BottomBar {
  BottomBar(this.title, this.icon);
  final String icon, title;
}

class DashboardController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final tabs = <BottomBar>[
    BottomBar('Home', AppImage.home),
    BottomBar('Search', AppImage.search),
    BottomBar('Notification', AppImage.notification),
    BottomBar('Me', AppImage.user),
  ];
  final _currentIndex = 0.obs;
  int get currentIndex => _currentIndex.value;
  set currentIndex(int val) => _currentIndex(val);

  late TabController tabController;

  @override
  void onInit() {
    tabController = TabController(length: tabs.length, vsync: this);
    super.onInit();
  }
}
