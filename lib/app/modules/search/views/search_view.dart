import 'package:get/get.dart';

import '../../../core/styles/style.dart';
import '../controllers/search_controller.dart';
import 'search_view_success.dart';

class SearchView extends GetView<SearchController> {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _SearchWidget(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                ),
                child: 'Top searches'
                    .text
                    .size(21)
                    .color(AppTheme.titleColor)
                    .semiBold
                    .make(),
              ),
              Wrap(
                runSpacing: 7,
                spacing: 7,
                children: controller.tags
                    .map(
                      (e) => _Tag(e),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SearchWidget extends StatelessWidget {
  const _SearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: const Color(0xffF2F3F5),
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: 'Find your colleague',
          hintStyle: const TextStyle(
            color: Color(0xff8D97AA),
            fontSize: 13,
          ),
          border: InputBorder.none,
          prefixIcon: SizedBox(
            width: 40,
            height: 40,
            child: Center(
              child: Image.asset(
                'assets/momo/search.png',
                height: 14,
              ),
            ),
          ),
          prefixIconConstraints: const BoxConstraints(
            maxHeight: 40,
            maxWidth: 40,
          ),
        ),
        onFieldSubmitted: (val) {
          Get.to(() => SearchSuccess(searchText: val));
        },
      ),
    );
  }
}

class _Tag extends StatelessWidget {
  const _Tag(this.title, {Key? key, this.onTap}) : super(key: key);
  final String title;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return title.text
        .size(13)
        .color(AppTheme.titleColor)
        .make()
        .box
        .padding(Vx.mSymmetric(h: 15, v: 5))
        .withRounded(value: 18)
        .gray100
        .make();
  }
}
