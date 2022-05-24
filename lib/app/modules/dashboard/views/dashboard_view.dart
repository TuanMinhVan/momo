import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../../../core/styles/style.dart';
import '../../home/views/home_view.dart';
import '../../notification/views/notification_view.dart';
import '../../profile/views/profile_view.dart';
import '../../search/views/search_view.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: controller.tabs.length,
      child: Scaffold(
        body: const TabBarView(
          children: [
            HomeView(),
            SearchView(),
            NotificationView(),
            ProfileView(),
          ],
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            currentIndex: controller.currentIndex,
            type: BottomNavigationBarType.fixed,
            unselectedLabelStyle: context.bodyText1.copyWith(fontSize: 12),
            selectedLabelStyle: context.bodyText1.copyWith(fontSize: 12),
            selectedItemColor: context.primary,
            unselectedItemColor: const Color(0xffB9B9B9),
            items: controller.tabs
                .asMap()
                .entries
                .map(
                  (e) => BottomNavigationBarItem(
                    label: e.value.title,
                    icon: SvgPicture.asset(
                      e.value.icon,
                      color: e.key == controller.currentIndex
                          ? context.primary
                          : null,
                    ),
                  ),
                )
                .toList(),
            onTap: (int index) {
              controller.currentIndex = index;
            },
          ),
        ),
      ),
    );
  }
}
