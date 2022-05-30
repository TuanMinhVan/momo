import 'package:get/get.dart';

import '../../../core/styles/style.dart';
import '../../../widgets/app_bar.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        elevation: 0,
        centerTitle: false,
        background: const Color(0xffF2F3F5),
        titleBuilder: (val) {
          return 'My Account'
              .text
              .size(21)
              .semiBold
              .color(AppTheme.titleColor)
              .make();
        },
      ),
      body: Column(
        children: [
          ColoredBox(
            color: const Color(0xffF2F3F5),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const CircleAvatar(
                    radius: 65,
                    backgroundImage: AssetImage('assets/momo/user_large.png'),
                  ),
                  Dimensions.height10,
                  'Elisa Fasan Thery'
                      .text
                      .size(18)
                      .semiBold
                      .center
                      .color(AppTheme.titleColor)
                      .make(),
                  Center(
                    child: InkWell(
                      child: 'Change Avatar'.text.blue500.make(),
                      onTap: () {},
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
