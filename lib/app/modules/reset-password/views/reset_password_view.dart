import 'package:get/get.dart';

import '../../../core/styles/style.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/common/app_button.dart';
import '../../../widgets/common/input_custom.dart';
import '../controllers/reset_password_controller.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  const ResetPasswordView({Key? key}) : super(key: key);

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
              'Reset your password'
                  .text
                  .color(AppTheme.titleColor)
                  .size(28)
                  .make(),
              'Please enter a new password'
                  .text
                  .color(AppTheme.titleColor)
                  .size(16)
                  .light
                  .make(),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    InputCustom(
                      hintText: 'Password',
                      isShowPrefixIcon: true,
                      prefixIcon: Icon(Icons.lock_outline),
                    ),
                    Dimensions.height10,
                    InputCustom(
                      hintText: 'Re-enter password',
                      isShowPrefixIcon: true,
                      prefixIcon: Icon(Icons.lock_outline),
                    )
                  ],
                ),
              ),
              AppButton(
                'Reset Password',
                onPressed: () {
                  Get.toNamed(Routes.dashboard);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
