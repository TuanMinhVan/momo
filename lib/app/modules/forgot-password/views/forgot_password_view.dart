import 'package:get/get.dart';

import '../../../core/styles/style.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/common/app_button.dart';
import '../../../widgets/common/input_custom.dart';
import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: 30,
            top: 50,
            left: 20,
            right: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              'Forgot your password?'
                  .text
                  .color(AppTheme.titleColor)
                  .size(28)
                  .make(),
              'Please enter the email address associated with your account'
                  .text
                  .color(AppTheme.titleColor)
                  .size(16)
                  .light
                  .make(),
              const Expanded(
                child: Center(
                  child: InputCustom(
                    hintText: 'Email',
                    isShowPrefixIcon: true,
                    prefixIcon: Icon(Icons.person_outlined),
                  ),
                ),
              ),
              AppButton(
                'Next',
                onPressed: () {
                  Get.toNamed(Routes.verifyOtp);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
