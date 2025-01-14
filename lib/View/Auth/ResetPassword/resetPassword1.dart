import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:study_hub/Constants/constant.dart';
import 'package:study_hub/Route/RouteName.dart';
import 'package:study_hub/View/Auth/ResetPasswordController/controller.dart';
import 'package:study_hub/Widget/CustomButton.dart';
import 'package:study_hub/Widget/TextStyle.dart';
import 'package:study_hub/Widget/customTextFeild.dart';

class resetPassword1 extends StatelessWidget {
  const resetPassword1({super.key});

  @override
  Widget build(BuildContext context) {
    ResetController resetController = Get.put(ResetController());
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
                    'Email',
                    style: CustomTextStyle.BodyBold.copyWith(
                      color: Color(0xff374151),
                      fontSize: 14.sp,
                    ),
                  ),
                  CustomTextInputField(
                      textInputAction: TextInputAction.next,
                      hintText: 'Enter Email',
                      controller: resetController.email,
                      obscureText: false,
                      mandatoryField: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Email is required';
                        }

                        return null;
                      }),
                  SizedBox(
                    height: 30.h,
                  ),
                  customButton(
                      backgroundColor: AppConstant.buttonColor,
                      padding: EdgeInsets.symmetric(
                          vertical: 12.h, horizontal: 100.w),
                      title: 'Reset Password',
                      onPressed: () async {
                        if (_key.currentState!.validate()) {
                          await Get.toNamed(RouteName.resetPassword,
                              arguments: {'email': resetController.email.text});
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
