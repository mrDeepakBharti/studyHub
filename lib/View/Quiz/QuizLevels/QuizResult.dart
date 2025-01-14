import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:study_hub/Constants/constant.dart';
import 'package:study_hub/Route/RouteName.dart';
import 'package:study_hub/Widget/CustomButton.dart';
import 'package:study_hub/Widget/TextStyle.dart';
import 'package:study_hub/Widget/appBar.dart';

class Quizresult extends StatelessWidget {
  const Quizresult({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstant.appBackGround,
      appBar: CustomAppBar(
        showAvatar: true,
        title: 'Winner',
        onAction2: () {
          Get.toNamed(RouteName.search);
        },
        onAction1: () {
          Get.toNamed(RouteName.notifications);
        },
        notificationIcon: 'asset/images/notificationIcon.png',
        searchIcon: 'asset/images/searchImage.png',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Container(
          width: Get.width,
          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 25.h),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(8.r))),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 160.h,
                  width: 160.w,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('asset/images/winner.png'),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'asset/images/🎉 Excellent Work! 🎉@4x.png',
                      height: 32.h,
                      width: 30.w,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      'Excellent Work!',
                      style: CustomTextStyle.BodyBold.copyWith(
                        fontSize: 24.sp,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Image.asset(
                      'asset/images/🎉 Excellent Work! 🎉@4x.png',
                      height: 32.h,
                      width: 30.w,
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  "You've mastered Level 1 with flying colors!",
                  textAlign: TextAlign.center,
                  style: CustomTextStyle.bodyNormal.copyWith(
                    fontSize: 18.sp,
                    color: Color(0xff4B5563),
                  ),
                ),
                SizedBox(
                  height: 14.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Correct Answer',
                      style: CustomTextStyle.bodyNormal
                          .copyWith(color: Color(0xff4B5563)),
                    ),
                    Text(
                      '9/10',
                      style: CustomTextStyle.BodyBold.copyWith(
                          color: Color(0xff16A34A), fontSize: 20.sp),
                    )
                  ],
                ),
                SizedBox(
                  height: 11.h,
                ),
                LinearProgressIndicator(
                  value: 0.5,
                  color: Color(0xff16A34A),
                  backgroundColor: Colors.grey[300],
                  minHeight: 8,
                ),
                SizedBox(
                  height: 24.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Time Taken:',
                      style: CustomTextStyle.bodyNormal
                          .copyWith(color: Color(0xff4B5563)),
                    ),
                    Text(
                      '2:45',
                      style: CustomTextStyle.BodyBold.copyWith(
                          color: Color(0xff3D348B)),
                    )
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Accuracy:',
                      style: CustomTextStyle.bodyNormal
                          .copyWith(color: Color(0xff4B5563)),
                    ),
                    Text(
                      '90%',
                      style: CustomTextStyle.BodyBold.copyWith(
                          color: Color(0xff3D348B)),
                    )
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Points Earned:',
                      style: CustomTextStyle.bodyNormal
                          .copyWith(color: Color(0xff4B5563)),
                    ),
                    Text(
                      '+45',
                      style: CustomTextStyle.BodyBold.copyWith(
                          color: Color(0xff3D348B)),
                    )
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                customButton(
                    backgroundColor: AppConstant.buttonColor,
                    padding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 59.w),
                    title: 'Continue to level 2',
                    onPressed: () {},
                    style: CustomTextStyle.bodyNormal.copyWith(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500)),
                SizedBox(
                  height: 16.h,
                ),
                customButton(
                    backgroundColor: Color(0xffF3F4F6),
                    padding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 95.w),
                    title: 'Share Result',
                    onPressed: () {},
                    style: CustomTextStyle.bodyNormal.copyWith(
                        color: Color(0xff374151),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500)),
                SizedBox(
                  height: 16.h,
                ),
                customButton(
                    backgroundColor: Colors.white,
                    borderColor: AppConstant.appBackGround,
                    borderWidth: 2,
                    padding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 95.w),
                    title: 'Try Again',
                    onPressed: () {},
                    style: CustomTextStyle.bodyNormal.copyWith(
                        color: AppConstant.buttonColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
