import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../core/styles/style.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/common/app_button.dart';
import '../controllers/verify_otp_controller.dart';

class VerifyOtpView extends GetView<VerifyOtpController> {
  const VerifyOtpView({Key? key}) : super(key: key);

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
              'Enter OTP'.text.color(AppTheme.titleColor).size(28).make(),
              'Kindly check your email and enter the OTP below'
                  .text
                  .color(AppTheme.titleColor)
                  .size(16)
                  .light
                  .make(),
              Expanded(
                child: Center(
                  child: PinCodeTextField(
                    appContext: context,
                    length: 6,
                    autoDisposeControllers: false,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      borderWidth: 1,
                      borderRadius: BorderRadius.circular(5),
                      shape: PinCodeFieldShape.box,
                      selectedFillColor: context.primaryColor,
                      inactiveFillColor: Colors.white,
                      activeFillColor: context.primaryColor,
                      inactiveColor: const Color(0xffC3C3C3),
                      activeColor: const Color(0xffC3C3C3),
                      disabledColor: context.primaryColor,
                      fieldHeight: 58,
                      fieldWidth: 58,
                    ),
                    textStyle: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.normal,
                    ),
                    enableActiveFill: true,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {},
                  ),
                ),
              ),
              AppButton(
                'Next',
                onPressed: () {
                  Get.toNamed(Routes.resetPassword);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
