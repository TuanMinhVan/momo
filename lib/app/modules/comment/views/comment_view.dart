import 'package:get/get.dart';

import '../../../core/styles/style.dart';
import '../../../core/utilities/image.dart';
import '../../../data/models/modes.dart';
import '../../../widgets/app_bar.dart';
import '../../../widgets/reaction_button/reaction_button.dart';
import '../../home/controllers/home_controller.dart';
import '../controllers/comment_controller.dart';

class CommentView extends GetView<CommentController> {
  const CommentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(title: 'Comment'),
      body: Column(children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: const [
                _CommentItem(
                  auth: 'Steven Chong',
                  comment:
                      'Hi guys, our new self-learning program is launched today! The topic is super hot and I think everyone of you has once thought about it. Discover now!',
                  date: '3 days',
                ),
                Divider(),
                _CommentItem(
                  auth: 'Elisa Lim',
                  comment: 'Love it! Gonna register now!',
                  date: '2 hours ago',
                  total: 1,
                  icons: ['like'],
                ),
                Dimensions.height5,
                _CommentItem(
                  auth: 'Emma Ng',
                  comment:
                      'How to register? I’m quite new here. Anyone can help?',
                  date: '3 hours ago',
                  total: 5,
                  icons: ['like', 'love'],
                  comments: [
                    _CommentItem(
                      auth: 'Steven Chong',
                      comment:
                          'You login to your account , go to E-learning and browse to look for the course',
                      date: '2 hours ago',
                      padding: EdgeInsets.only(
                        left: 40,
                        top: 15,
                        right: 0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const _BottomBarAction(),
      ]),
    );
  }
}

class _CommentItem extends StatelessWidget {
  const _CommentItem({
    Key? key,
    required this.auth,
    required this.comment,
    required this.date,
    this.icons = const [],
    this.comments = const [],
    this.total = 0,
    this.padding,
  }) : super(key: key);
  final String auth, comment, date;
  final List<String> icons;
  final int total;
  final List<Widget> comments;
  final EdgeInsets? padding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(AppImage.userAvatar),
              ),
              Dimensions.width10,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    auth.richText
                        .withTextSpanChildren([
                          ' $comment'.textSpan.normal.size(12).make(),
                        ])
                        .color(AppTheme.titleColor)
                        .size(13)
                        .semiBold
                        .make(),
                    Row(
                      children: [
                        date.text
                            .size(12)
                            .color(AppTheme.titleColor.withOpacity(.63))
                            .make(),
                        const _CommentReaction(),
                        const Spacer(),
                        if (total != 0) ...[
                          '$total'
                              .text
                              .size(11)
                              .color(AppTheme.titleColor)
                              .make(),
                          const SizedBox(width: 2),
                          ...icons.map((e) => Image.asset(
                              'assets/reactions/$e.png',
                              height: 14))
                        ]
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          ...comments,
          if (comments.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: Row(
                children: [
                  const SizedBox(width: 32, child: Divider(height: 1)),
                  TextButton(
                    child: 'Hide the replies'
                        .text
                        .size(12)
                        .color(AppTheme.titleColor.withOpacity(.63))
                        .make(),
                    onPressed: () {},
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }
}

class _CommentReaction extends StatefulWidget {
  const _CommentReaction({Key? key}) : super(key: key);
  @override
  State<_CommentReaction> createState() => _CommentReactionState();
}

class _CommentReactionState extends State<_CommentReaction> {
  HomeController get home => Get.find();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          height: 40,
          child: ReactionButtonToggle<String>(
            onReactionChanged: (String? value, bool isChecked) {},
            reactions: reactions,
            initialReaction: Reaction(
              icon: Padding(
                padding: Vx.mSymmetric(h: 15, v: 10),
                child: 'Like'
                    .text
                    .size(11)
                    .medium
                    .color(AppTheme.titleColor.withOpacity(.63))
                    .make(),
              ),
              value: null,
            ),
            selectedReaction: reactions[0],
            onShow: (bool isShow) {},
          ),
        ),
        InkWell(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            child: 'Reply'
                .text
                .size(11)
                .medium
                .color(AppTheme.titleColor.withOpacity(.63))
                .make(),
          ),
          onTap: () {},
        ),
      ],
    );
  }
}

class _BottomBarAction extends StatelessWidget {
  const _BottomBarAction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 63,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      width: double.infinity,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: Color(0xffE4E6EA), width: .5),
        ),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(AppImage.userAvatar),
          ),
          Dimensions.width10,
          Expanded(
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: const Color(0xffE4E6EA),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter your comment…',
                        hintStyle: TextStyle(fontSize: 12),
                        contentPadding: EdgeInsets.fromLTRB(20, 10, 12, 12),
                        isDense: true,
                        enabled: true,
                      ),
                    ),
                  ),
                  'Post'.text.blue500.medium.make(),
                  Dimensions.width10,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
