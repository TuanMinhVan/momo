import 'package:get/get.dart';

import '../../../core/styles/style.dart';
import '../../../core/utilities/image.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/common/app_button.dart';
import '../../../widgets/common/input_custom.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Material(
                color: const Color(0xffF2F3F5),
                borderRadius: BorderRadius.circular(20),
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 8,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        CircleAvatar(
                          backgroundImage: AssetImage(AppImage.enFlag),
                          radius: 10,
                        ),
                        Dimensions.width10,
                        Text(
                          'English',
                          style: TextStyle(
                            color: AppTheme.titleColor,
                          ),
                        ),
                        Dimensions.width5,
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: AppTheme.titleColor,
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: context.screenHeight / 2.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppImage.momo,
                      width: 95,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 30.h),
                    'Continue with your'
                        .text
                        .size(24)
                        .color(AppTheme.titleColor)
                        .make(),
                    'Login'
                        .text
                        .size(28)
                        .bold
                        .color(AppTheme.titleColor)
                        .make(),
                  ],
                ),
              ),
              const InputCustom(
                hintText: 'Email',
                isShowPrefixIcon: true,
                prefixIcon: Icon(Icons.person_outlined),
              ),
              Dimensions.height10,
              const InputCustom(
                hintText: 'Password',
                isShowPrefixIcon: true,
                prefixIcon: Icon(Icons.lock_outline),
              ),
              SizedBox(height: context.screenHeight * .1),
              AppButton(
                'Login',
                onPressed: () {
                  Get.offAllNamed(Routes.dashboard);
                },
              ),
              Center(
                child: TextButton(
                  child: 'Forgot Password?'.text.hexColor('#0089FC').make(),
                  onPressed: () {
                    Get.toNamed(Routes.forgotPassword);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
