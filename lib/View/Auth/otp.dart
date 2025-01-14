import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:study_hub/Constants/constant.dart';
import 'package:study_hub/Route/RouteName.dart';
import 'package:study_hub/View/Auth/authController/controller.dart';
import 'package:study_hub/Widget/CustomButton.dart';
import 'package:study_hub/Widget/TextStyle.dart';

class SignupOtp extends StatefulWidget {
  final bool? isForResetPassword;
  SignupOtp({super.key, this.isForResetPassword});

  @override
  State<SignupOtp> createState() => _SignupOtpState();
}

class _SignupOtpState extends State<SignupOtp> {
  AuthController controller = Get.put(AuthController());
  late String email;
  // var email = Get.arguments['email'];
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    email = Get.arguments?['email'] ?? '';
    controller.startTimer();
  }

  @override
  Widget build(BuildContext context) {
    AuthController controller = Get.put(AuthController());
    return Container(
      color: AppConstant.appBackGround,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 40.w, right: 40.w, top: 149.h),
            child: Form(
              key: _key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      height: 64.h,
                      width: 64.w,
                      child: Image.asset(
                        'asset/images/AuthImage/signup.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(height: 28.h),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      widget.isForResetPassword == true
                          ? 'Please enter the verification code sent to reset your password.'
                          : 'Welcome to PadhaiKaro! Please enter the verification code sent to your email address to complete your registration',
                      textAlign: TextAlign.center,
                      style: CustomTextStyle.bodyNormal
                          .copyWith(color: Color(0xff4B5563)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 24.h),
                    child: PinCodeTextField(
                      controller: controller.otp,
                      maxLength: 4,
                      pinBoxHeight: 45.h,
                      pinBoxWidth: 45.w,

                      wrapAlignment: WrapAlignment.center,
                      hasTextBorderColor: const Color(0xFF65656A),
                      defaultBorderColor: const Color(0xFF4B5563),
                      pinBoxOuterPadding:
                          EdgeInsets.symmetric(horizontal: 16.w),
                      pinBoxDecoration:
                          ProvidedPinBoxDecoration.defaultPinBoxDecoration,

                      pinTextStyle: CustomTextStyle.h2.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 20.sp,
                          color: const Color(0xff65656A)),
                      pinBoxRadius: 8.r,
                      pinBoxBorderWidth: 1,

                      // onTextChanged: (value){
                      //   otpController.otpValueController.text = value;
                      //   otpController.isOTPFilled.value = false;
                      // },
                    ),
                  ),
                  customButton(
                      padding: EdgeInsets.symmetric(
                          vertical: 12.h, horizontal: 115.w),
                      backgroundColor: AppConstant.buttonColor,
                      title: 'Verify OTP',
                      onPressed: () async {
                        if (_key.currentState!.validate() &&
                            controller.otp == 4) {
                          if (widget.isForResetPassword == true) {
                            Get.offAllNamed(RouteName.login);
                          } else {
                            controller.verifyOtp(
                                email: email, otp: controller.otp.text);
                            // Get.offAllNamed(RouteName.selectCategory);
                          }
                        }
                      },
                      style: CustomTextStyle.bodyNormal.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      )),
                  SizedBox(
                    height: 16.h,
                  ),
                  Obx(() {
                    int minutes = controller.timeRemaining.value ~/ 60;
                    int seconds = controller.timeRemaining.value % 60;
                    String timeString =
                        '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';

                    bool isTimerRunning = controller.timeRemaining.value > 0;

                    return RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: isTimerRunning
                              ? 'Resend OTP in $timeString'
                              : "Didn't receive code? ",
                          style: CustomTextStyle.bodyNormal.copyWith(
                            color: Color(0xff4B5563),
                            fontSize: 14.sp,
                          ),
                        ),
                        if (!isTimerRunning)
                          TextSpan(
                            text: 'Resend',
                            style: CustomTextStyle.bodyNormal.copyWith(
                              color: AppConstant.buttonColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                controller.resendOtp(
                                    email: email); // Resend OTP on tap
                                controller.startTimer(); // Start timer on tap
                              },
                          ),
                      ]),
                    );
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
