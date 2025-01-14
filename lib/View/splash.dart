import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:study_hub/Constants/constant.dart';
import 'package:study_hub/Route/RouteName.dart';
import 'package:study_hub/Widget/TextStyle.dart';
import 'package:study_hub/utils/sharedPreference/localDatabase.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      var token = UserSimplePreferences.getProfileToken();
      if (token != null && token.isNotEmpty) {
        Get.offAllNamed(RouteName.bottomNav);
      } else {
        Get.offAllNamed(RouteName.login);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppConstant.appBackGround),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 130.h,
                width: 130.w,
                child: Image.asset(
                  'asset/images/AuthImage/DIV@4x.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Text('Padhai Karo',
                style: CustomTextStyle.h1.copyWith(color: Color(0xff3D348B))),
            Text(
              'Your Learning Journey Begins Here',
              style:
                  CustomTextStyle.bodyNormal.copyWith(color: Color(0xff6B7280)),
            )
          ],
        ),
      ),
    );
  }
}
