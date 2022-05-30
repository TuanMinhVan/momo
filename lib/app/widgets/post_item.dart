import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

import '../core/styles/style.dart';
import '../core/utilities/utilities.dart';
import '../data/models/modes.dart';
import '../routes/app_pages.dart';
import 'reaction_button/reaction_button.dart';

class PostItem extends StatelessWidget {
  const PostItem({
    Key? key,
    required this.auth,
    required this.avatar,
    required this.content,
    required this.date,
    required this.image,
    this.authTap,
    this.icons = const [],
    this.like = 0,
    this.comment = 0,
    this.maxLine = 2,
  }) : super(key: key);
  final String auth, content, date, image, avatar;
  final List<String> icons;
  final int like, comment, maxLine;
  final VoidCallback? authTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: authTap,
          leading: CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(avatar),
          ),
          title: auth.text.color(AppTheme.titleColor).size(13).semiBold.make(),
          subtitle: date.text
              .size(12)
              .color(AppTheme.titleColor.withOpacity(.63))
              .make(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ReadMoreText(
            content,
            trimLines: maxLine,
            colorClickableText: Colors.blue,
            trimMode: TrimMode.Line,
            trimCollapsedText: 'Read more',
            trimExpandedText: ' show less',
            style: const TextStyle(color: Colors.black, fontSize: 12),
          ),
        ),
        Dimensions.height10,
        SizedBox(
          height: 180.h,
          width: double.infinity,
          child: Image.asset(image, fit: BoxFit.cover),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 8,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ...icons.map(
                    (e) => Image.asset('assets/reactions/$e.png', height: 14),
                  ),
                  Dimensions.width5,
                  '$like'.text.color(AppTheme.titleColor).size(11).make(),
                ],
              ),
              '$comment comments'
                  .text
                  .color(AppTheme.titleColor)
                  .size(11)
                  .make(),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: Divider(height: 1),
        ),
        const _PostReaction(),
      ],
    );
  }
}

class _PostReaction extends StatefulWidget {
  const _PostReaction({Key? key}) : super(key: key);

  @override
  State<_PostReaction> createState() => _PostReactionState();
}

class _PostReactionState extends State<_PostReaction>
    with AutomaticKeepAliveClientMixin {
  final isShowReaction = true.obs;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SizedBox(
      height: 40,
      child: Stack(
        children: [
          Row(
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
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/icons/like.png',
                            height: 14,
                          ),
                          const SizedBox(width: 5),
                          const Text(
                            'Like',
                            style: TextStyle(
                              fontSize: 11,
                              color: AppTheme.titleColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    value: null,
                  ),
                  selectedReaction: reactions[0],
                  onShow: (bool isShow) {
                    isShowReaction.value = !isShow;
                  },
                ),
              ),
              InkWell(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        AppImage.comment,
                        height: 14,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 5),
                      const Text(
                        'Comment',
                        style: TextStyle(
                          fontSize: 11,
                          color: AppTheme.titleColor,
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Get.toNamed(Routes.comment);
                },
              ),
            ],
          ),
          Obx(
            () => !isShowReaction.value
                ? 'Release to cancel'
                    .text
                    .size(11)
                    .center
                    .color(AppTheme.titleColor)
                    .makeCentered()
                    .box
                    .white
                    .make()
                    .h(40)
                : Dimensions.empty,
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
