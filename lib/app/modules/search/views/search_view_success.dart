import 'package:get/get.dart';

import '../../../core/styles/style.dart';
import '../../../core/utilities/utilities.dart';
import '../../../widgets/post_item.dart';
import 'search_detail_view.dart';

class SearchSuccess extends StatelessWidget {
  const SearchSuccess({Key? key, required this.searchText}) : super(key: key);
  final String searchText;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: Get.back,
                  ),
                  Expanded(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: const Color(0xffF2F3F5),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: TextFormField(
                          initialValue: searchText,
                          decoration: const InputDecoration(
                            hintText: 'Find your colleague',
                            hintStyle: TextStyle(
                              color: Color(0xff8D97AA),
                              fontSize: 13,
                            ),
                            border: InputBorder.none,
                          ),
                          onFieldSubmitted: (val) {},
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 20,
                      ),
                      child: 'Top results'
                          .text
                          .size(21)
                          .color(AppTheme.titleColor)
                          .semiBold
                          .make(),
                    ),
                    ListTile(
                      leading: const CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage(AppImage.momo),
                      ),
                      title: 'Momo HR'
                          .text
                          .color(AppTheme.titleColor)
                          .size(15)
                          .semiBold
                          .make(),
                      onTap: () {
                        Get.to(() => const SearchDetailView());
                      },
                    ),
                    Container(
                      height: 5,
                      color: Colors.grey.shade200,
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: 'All Posts'
                          .text
                          .color(const Color(0xff8D97AA))
                          .size(14)
                          .semiBold
                          .make(),
                    ),
                    const PostItem(
                      auth: 'Momo HR',
                      content:
                          '[HOLIDAY UPDATES]\nHi all, please note that we will start our Holiday this Saturday 30/4 and end it on the next Thursda, You all will receive it from you',
                      date: '3 days',
                      image: AppImage.postImage,
                      avatar: AppImage.momo,
                      comment: 98,
                      like: 245,
                      icons: ['like', 'love', 'sad'],
                      maxLine: 3,
                    ),
                    Container(
                      height: 5,
                      color: Colors.grey.shade200,
                      width: double.infinity,
                    ),
                    const PostItem(
                      auth: 'Momo HR',
                      content:
                          '[HOLIDAY UPDATES]\nHi guys, we have launched the latest uniform T-shirt for our company. You all will receive it from you',
                      date: '3 days',
                      image: AppImage.postImage,
                      avatar: AppImage.momo,
                      comment: 98,
                      like: 263,
                      icons: ['like'],
                      maxLine: 3,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
