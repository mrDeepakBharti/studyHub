import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:study_hub/Constants/constant.dart';
import 'package:study_hub/Route/RouteName.dart';
import 'package:study_hub/View/Auth/ResetPasswordController/controller.dart';
import 'package:study_hub/View/Auth/otp.dart';
import 'package:study_hub/Widget/CustomButton.dart';
import 'package:study_hub/Widget/PasswordVisibility/loginVisibility.dart';
import 'package:study_hub/Widget/TextStyle.dart';
import 'package:study_hub/Widget/customTextFeild.dart';

class Resetpassword extends StatelessWidget {
  const Resetpassword({super.key});

  @override
  Widget build(BuildContext context) {
    PasswordVisibility controller = Get.put(PasswordVisibility());
    ResetController resetController = Get.put(ResetController());
    var email = Get.arguments['email'];
    final GlobalKey<FormState> _key = GlobalKey<FormState>();

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
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Reset Password',
                      textAlign: TextAlign.center,
                      style:
                          CustomTextStyle.h2.copyWith(color: Color(0xff3D348B)),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Enter your new password below',
                      style: CustomTextStyle.bodyNormal.copyWith(
                          color: Color(0xff4B5563),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  Text(
                    'New Password',
                    style: CustomTextStyle.BodyBold.copyWith(
                      color: Color(0xff374151),
                      fontSize: 14.sp,
                    ),
                  ),
                  Obx(() {
                    return CustomTextInputField(
                      textInputAction: TextInputAction.done,
                      hintText: 'Enter New Password',
                      suffixIcon: GestureDetector(
                        onTap: () {
                          resetController.toggle();
                        },
                        child: Icon(
                          Icons.remove_red_eye,
                          color: Color(0xff6B7280),
                        ),
                      ),
                      controller: resetController.newPassword,
                      obscureText: resetController.obscureText.value,
                      mandatoryField: true,
                      maxLines: 1,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required';
                        }
                        if (value.length < 8) {
                          return 'Password must be at least 8 characters';
                        }
                        if (!RegExp(r'[A-Z]').hasMatch(value)) {
                          return 'Password must contain at least one uppercase letter';
                        }
                        if (!RegExp(r'[a-z]').hasMatch(value)) {
                          return 'Password must contain at least one lowercase letter';
                        }
                        if (!RegExp(r'[0-9]').hasMatch(value)) {
                          return 'Password must contain at least one number';
                        }
                        if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]')
                            .hasMatch(value)) {
                          return 'Password must contain at least one special character';
                        }
                        return null;
                      },
                    );
                  }),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    'Confirm Password',
                    style: CustomTextStyle.BodyBold.copyWith(
                      color: Color(0xff374151),
                      fontSize: 14.sp,
                    ),
                  ),
                  Obx(() {
                    return CustomTextInputField(
                        textInputAction: TextInputAction.done,
                        hintText: 'Enter Confirm Password',
                        suffixIcon: GestureDetector(
                          onTap: () {
                            controller.confirmPasswordToggle();
                          },
                          child: Icon(
                            Icons.remove_red_eye,
                            color: Color(0xff6B7280),
                          ),
                        ),
                        controller: resetController.confirmPassword,
                        obscureText: controller.confirmPassword.value,
                        mandatoryField: true,
                        maxLines: 1,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Confirm Password is required';
                          }
                          if (value != resetController.newPassword.text) {
                            return 'Passwords do not match';
                          }
                          if (value.length < 8) {
                            return 'Password must be at least 8 characters';
                          }
                          if (!RegExp(r'[A-Z]').hasMatch(value)) {
                            return 'Password must contain at least one uppercase letter';
                          }
                          if (!RegExp(r'[a-z]').hasMatch(value)) {
                            return 'Password must contain at least one lowercase letter';
                          }
                          if (!RegExp(r'[0-9]').hasMatch(value)) {
                            return 'Password must contain at least one number';
                          }
                          if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]')
                              .hasMatch(value)) {
                            return 'Password must contain at least one special character';
                          }
                          return null;
                        });
                  }),
                  SizedBox(
                    height: 16.h,
                  ),
                  customButton(
                      backgroundColor: AppConstant.buttonColor,
                      padding: EdgeInsets.symmetric(
                          vertical: 12.h, horizontal: 90.w),
                      title: 'Confirm Password',
                      onPressed: () async {
                        if (_key.currentState!.validate()) {
                          resetController.resetPassword(
                              email: email,
                              newPassword: resetController.confirmPassword.text,
                              confirmPassword:
                                  resetController.confirmPassword.text);
                          await Get.to(
                              () => SignupOtp(
                                    isForResetPassword: true,
                                  ),
                              arguments: {'email': email});
                        }
                      },
                      style: CustomTextStyle.bodyNormal.copyWith(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      )),
                  SizedBox(
                    height: 16.h,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                        onTap: () {
                          Get.toNamed(RouteName.login);
                        },
                        child: Text(
                          'Back to Login',
                          style: CustomTextStyle.bodyNormal.copyWith(
                            color: AppConstant.buttonColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
