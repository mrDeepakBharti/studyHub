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

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
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
                        'asset/images/AuthImage/DIV@4x.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Welcome to PadhaiKaro',
                      textAlign: TextAlign.center,
                      style:
                          CustomTextStyle.h2.copyWith(color: Color(0xff3D348B)),
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
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
                    hintText: 'Enter Name',
                    controller: authController.email,
                    obscureText: false,
                    mandatoryField: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email is required';
                      }
                      // Gmail validation regex

                      return null;
                    },
                  ),
                  SizedBox(
                    height: 16.h,
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
                      controller: authController.password,
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
                          vertical: 12.h, horizontal: 92.w),
                      icon: Icons.login,
                      backgroundColor: AppConstant.buttonColor,
                      title: 'Start Learning',
                      onPressed: () async {
                        if (_key.currentState!.validate()) {
                          await authController.userLogin(
                              email: authController.email.text,
                              password: authController.password.text);
                        }
                      },
                      style: CustomTextStyle.bodyNormal
                          .copyWith(color: Colors.white)),
                  SizedBox(
                    height: 13.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteName.resetPassword1);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Reset Password',
                            style: CustomTextStyle.bodyNormal
                                .copyWith(color: AppConstant.buttonColor)),
                        Icon(
                          Icons.arrow_forward,
                          color: AppConstant.buttonColor,
                        )
                      ],
                    ),
                  ),
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
                          'Continue With Google',
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
                          text: 'New to PadhaiKaro? ',
                          style: CustomTextStyle.bodyNormal
                              .copyWith(color: Color(0XFF4B5563))),
                      TextSpan(
                          text: 'Create Account',
                          style: CustomTextStyle.bodyNormal
                              .copyWith(color: AppConstant.buttonColor),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.toNamed(RouteName.signup);
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
