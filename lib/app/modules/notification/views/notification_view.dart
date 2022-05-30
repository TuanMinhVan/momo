import 'package:get/get.dart';

import '../../../core/styles/style.dart';
import '../../../core/utilities/image.dart';
import '../../../widgets/app_bar.dart';
import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        elevation: 0,
        background: const Color(0xffF2F3F5),
        titleBuilder: (val) {
          return 'Notification'
              .text
              .size(21)
              .semiBold
              .color(AppTheme.titleColor)
              .make();
        },
        centerTitle: false,
        actions: [
          PopupMenuButton(
            child: const SizedBox(
              child: Icon(Icons.more_vert, color: AppTheme.titleColor),
              width: 40,
            ),
            onSelected: (val) {},
            itemBuilder: (context) => const [
              PopupMenuItem<String>(
                child: ListTile(
                  title: Text('Mark all as read'),
                ),
                value: 'profile',
              ),
              PopupMenuItem<String>(
                child: ListTile(
                  title: Text('Clear all'),
                ),
                value: 'setting',
              ),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              NotificationGroup(),
              NotificationGroup(),
            ],
          ),
        ),
      ),
    );
  }
}

class NotificationGroup extends StatelessWidget {
  const NotificationGroup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 20, 20, 0),
          child: 'Today, 29-11-2020'
              .text
              .size(13)
              .color(const Color(0xff8D97AA))
              .make(),
        ),
        ListView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: const [
            _NotificationItem(
              auth: 'Momo HR',
              content:
                  'Your bank account has been updated. Go to Your profile to check!',
              date: '09:45 AM',
              avatar: AppImage.momo,
              isRead: true,
            ),
            _NotificationItem(
              auth: 'Steven Chong',
              content:
                  'Commented on your post: “Really nice! Love this news much!”',
              date: '09:42 AM',
              avatar: AppImage.userAvatar,
              isRead: false,
            ),
          ],
        )
      ],
    );
  }
}

class _NotificationItem extends StatelessWidget {
  const _NotificationItem({
    Key? key,
    required this.auth,
    required this.date,
    required this.content,
    required this.avatar,
    this.isRead = false,
  }) : super(key: key);
  final String auth, date, content, avatar;
  final bool isRead;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: isRead ? Colors.transparent : const Color(0xffE8F3FE),
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 18, 15, 18),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: CircleAvatar(
                  radius: 23,
                  backgroundImage: AssetImage(avatar),
                ),
              ),
              Dimensions.width10,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    auth.text
                        .color(AppTheme.titleColor)
                        .size(15)
                        .semiBold
                        .make(),
                    content.text
                        .color(const Color(0xff8D97AA))
                        .size(13)
                        .medium
                        .make(),
                  ],
                ),
              ),
              Dimensions.width10,
              date.text
                  .color(const Color(0xff0089FC))
                  .size(11)
                  .minFontSize(11)
                  .make(),
            ],
          ),
        ),
      ),
    );
  }
}
