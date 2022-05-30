import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/styles/style.dart';
import '../../../widgets/app_bar.dart';

class AboutView extends StatelessWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(
        background: Color(0xffF2F3F5),
        title: 'About',
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              'General Information'
                  .text
                  .size(18)
                  .semiBold
                  .color(AppTheme.titleColor)
                  .make(),
              Dimensions.height20,
              const _ListTitle(
                title: '01-05-1990',
                subtitle: 'Birthday',
                icon: 'assets/momo/birthday.svg',
              ),
              Dimensions.height20,
              const _ListTitle(
                title: 'Female',
                subtitle: 'Gender',
                icon: 'assets/momo/user.svg',
              ),
              Dimensions.height20,
              const _ListTitle(
                title: '11-02-2008',
                subtitle: 'Onboarding at',
                icon: 'assets/momo/calendar.svg',
              ),
              Container(
                height: 0.5,
                color: Colors.grey.shade200,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 15,
                ),
              ),
              'Working History'
                  .text
                  .size(18)
                  .semiBold
                  .color(AppTheme.titleColor)
                  .make(),
              Dimensions.height20,
              const _WorkingHistory(
                title: 'HR Team',
                subtitle: '2009 - Present',
              ),
              Container(
                height: 0.5,
                color: Colors.grey.shade200,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(
                  vertical: 15,
                ),
              ),
              const _WorkingHistory(
                title: 'Social Media Manager',
                subtitle: '2008 - 2009',
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _WorkingHistory extends StatelessWidget {
  const _WorkingHistory({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);
  final String title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title.text.color(AppTheme.titleColor).size(15).medium.make(),
        subtitle.text.color(const Color(0xff8D97AA)).size(13).medium.make(),
      ],
    );
  }
}

class _ListTitle extends StatelessWidget {
  const _ListTitle({
    Key? key,
    required this.title,
    required this.icon,
    required this.subtitle,
    this.onTap,
  }) : super(key: key);
  final String title, icon, subtitle;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 23,
          child: SvgPicture.asset(icon),
          backgroundColor: const Color(0xffF2F3F5),
        ),
        Dimensions.width10,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              title.text.color(AppTheme.titleColor).size(15).medium.make(),
              subtitle.text
                  .color(const Color(0xff8D97AA))
                  .size(13)
                  .medium
                  .make(),
            ],
          ),
        )
      ],
    );
  }
}
