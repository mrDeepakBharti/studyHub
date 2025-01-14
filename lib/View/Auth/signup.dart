import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:study_hub/Constants/constant.dart';
import 'package:study_hub/Route/RouteName.dart';
import 'package:study_hub/View/Auth/authController/controller.dart';
import 'package:study_hub/Widget/CustomButton.dart';
import 'package:study_hub/Widget/PasswordVisibility/loginVisibility.dart';
import 'package:study_hub/Widget/TextStyle.dart';
import 'package:study_hub/Widget/customTextFeild.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController controller = Get.put(AuthController());
    PasswordVisibility visibility = Get.put(PasswordVisibility());
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
                      'Create Account',
                      textAlign: TextAlign.center,
                      style:
                          CustomTextStyle.h2.copyWith(color: Color(0xff3D348B)),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Start your learning journey today',
                      textAlign: TextAlign.center,
                      style: CustomTextStyle.bodyNormal
                          .copyWith(color: Color(0xff4B5563)),
                    ),
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  Text(
                    'Name',
                    style: CustomTextStyle.BodyBold.copyWith(
                      color: Color(0xff374151),
                      fontSize: 14.sp,
                    ),
                  ),
                  CustomTextInputField(
                    textInputAction: TextInputAction.next,
                    hintText: 'Enter name',
                    controller: controller.name,
                    obscureText: false,
                    mandatoryField: true,
                    validator: (Value) {
                      if (Value!.isEmpty) {
                        return 'Name is required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    'Email',
                    style: CustomTextStyle.BodyBold.copyWith(
                      color: Color(0xff374151),
                      fontSize: 14.sp,
                    ),
                  ),
                  CustomTextInputField(
                      textInputAction: TextInputAction.next,
                      hintText: 'Enter Email',
                      controller: controller.signupEmail,
                      obscureText: false,
                      mandatoryField: true,
                      validator: (Value) {
                        if (Value!.isEmpty) {
                          return 'Email is required';
                        }

                        return null;
                      }),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    'Password',
                    style: CustomTextStyle.BodyBold.copyWith(
                      color: Color(0xff374151),
                      fontSize: 14.sp,
                    ),
                  ),
                  Obx(() {
                    return CustomTextInputField(
                      textInputAction: TextInputAction.done,
                      hintText: 'Enter Password',
                      suffixIcon: GestureDetector(
                        onTap: () {
                          visibility.toggle();
                        },
                        child: Icon(
                          Icons.remove_red_eye,
                          color: Color(0xff6B7280),
                        ),
                      ),
                      controller: controller.signuPassword,
                      obscureText: visibility.obscureText.value,
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
                  customButton(
                      padding: EdgeInsets.symmetric(
                          vertical: 12.h, horizontal: 125.w),
                      backgroundColor: AppConstant.buttonColor,
                      title: 'Sign Up',
                      onPressed: () async {
                        // Get.toNamed(RouteName.signupOtp);
                        if (_key.currentState!.validate()) {
                          controller.signup(
                              fullName: controller.name.text,
                              email: controller.signupEmail.text,
                              password: controller.signuPassword.text);
                        }
                      },
                      style: CustomTextStyle.bodyNormal
                          .copyWith(color: Colors.white)),
                  SizedBox(
                    height: 18.h,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 12.h, horizontal: 67.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: Colors.white,
                        border: Border.all(color: Color(0xffD1D5DB))),
                    child: Row(
                      children: [
                        Image.asset(
                          height: 20.h,
                          width: 20.w,
                          'asset/images/AuthImage/GoogleImage.png',
                          fit: BoxFit.contain,
                        ),
                        Text(
                          'Signup With Google',
                          style: CustomTextStyle.bodyNormal
                              .copyWith(color: Color(0xff374151)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 23.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Color(0xffD1D5DB),
                          thickness: 1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 11.w),
                        child: Text('or',
                            style: CustomTextStyle.bodyNormal.copyWith(
                                color: Color(0xff6B7280), fontSize: 14.sp)),
                      ),
                      Expanded(
                        child: Divider(
                          color: Color(0xffD1D5DB),
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 28.h,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: 'Already have an Account? ',
                          style: CustomTextStyle.bodyNormal
                              .copyWith(color: Color(0XFF4B5563))),
                      TextSpan(
                          text: 'Login',
                          style: CustomTextStyle.bodyNormal
                              .copyWith(color: AppConstant.buttonColor),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.toNamed(RouteName.login);
                            }),
                    ])),
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
