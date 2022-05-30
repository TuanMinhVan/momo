import 'package:get/get.dart';

import '../../../core/styles/style.dart';
import '../../../core/utilities/utilities.dart';
import '../../../widgets/app_bar.dart';
import '../../../widgets/post_item.dart';
import 'about_view.dart';

class SearchDetailView extends StatelessWidget {
  const SearchDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(
        background: Color(0xffF2F3F5),
        title: 'Momo HR',
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Dimensions.height15,
              const Center(
                child: CircleAvatar(
                  radius: 126 / 2,
                  backgroundImage: AssetImage(AppImage.momo),
                ),
              ),
              Dimensions.height10,
              'Momo HR'
                  .text
                  .color(AppTheme.titleColor)
                  .size(25)
                  .semiBold
                  .makeCentered(),
              Dimensions.height30,
              Container(
                height: 0.5,
                color: Colors.grey.shade200,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 10),
              ),
              ListTile(
                leading: CircleAvatar(
                  radius: 20,
                  child: Image.asset(
                    'assets/momo/office-bag.png',
                    width: 40,
                    height: 40,
                  ),
                  backgroundColor: Colors.white,
                ),
                title: 'Work at HR Team'.text.color(AppTheme.titleColor).make(),
              ),
              Container(
                height: 0.5,
                color: Colors.grey.shade200,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 10),
              ),
              ListTile(
                leading: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    'assets/momo/user.png',
                    width: 40,
                    height: 40,
                  ),
                ),
                title: 'Momo HR’s About Info'
                    .text
                    .color(AppTheme.titleColor)
                    .make(),
                onTap: () {
                  Get.to(() => const AboutView());
                },
              ),
              Container(
                height: 0.5,
                color: Colors.grey.shade200,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 10),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 20,
                ),
                child: 'Posts'
                    .text
                    .size(18)
                    .color(AppTheme.titleColor)
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
      ),
    );
  }
}
