import 'package:get/get.dart';

import '../../../core/styles/style.dart';
import '../../../core/utilities/image.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(AppImage.banner, width: double.infinity),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: SizedBox(
                height: 90,
                child: ListView.separated(
                  controller: controller.scrollController,
                  itemCount: controller.categories.length,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (BuildContext context, int index) {
                    return Dimensions.width10;
                  },
                  itemBuilder: (BuildContext context, int index) {
                    final item = controller.categories.elementAt(index);
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        DecoratedBox(
                          decoration: BoxDecoration(
                            color: const Color(0xffFBE6F1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: SizedBox(
                            width: 62,
                            height: 58,
                            child: Center(
                              child: Image.asset(
                                item.icon,
                                width: 32,
                                height: 25,
                              ),
                            ),
                          ),
                        ),
                        Dimensions.height5,
                        item.title.text
                            .color(AppTheme.titleColor)
                            .size(11)
                            .minFontSize(11)
                            .medium
                            .make(),
                      ],
                    );
                  },
                ),
              ),
            ),
            Center(
              child: Obx(
                () => DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [0, 1]
                        .asMap()
                        .entries
                        .map((e) => Material(
                              color: controller.categoryTab.value == e.key
                                  ? context.primary
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                              child: InkWell(
                                child: const SizedBox(width: 25, height: 4),
                                onTap: () {
                                  controller.jumToPage(e.key);
                                },
                              ),
                            ))
                        .toList(),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: 'Newsfeed'
                  .text
                  .size(18)
                  .color(AppTheme.titleColor)
                  .semiBold
                  .make(),
            ),
          ],
        ),
      ),
    );
  }
}
