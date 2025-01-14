import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:study_hub/Constants/constant.dart';
import 'package:study_hub/Route/RouteName.dart';
import 'package:study_hub/Widget/CustomButton.dart';
import 'package:study_hub/Widget/TextStyle.dart';
import 'package:study_hub/Widget/appBar.dart';

class Quiz extends StatelessWidget {
  const Quiz({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> quiz = [
      {
        'title': 'JEE Mains',
        'subtitle': 'Engineering Entrance',
        'icon': 'asset/images/examCategoryIcon/jee.png',
        'Quizs': '100+ Quizs',
        'color': Color(0xffDBEAFE) // Convert the int to a Color object
      },
      {
        'title': 'NEET',
        'subtitle': 'Medical Entrance',
        'icon': 'asset/images/examCategoryIcon/bio.png',
        'Quizs': '80+ Quizs',
        'color': Color(0xffDCFCE7) // Convert the int to a Color object
      },
      {
        'title': 'Class 12 Boards',
        'subtitle': 'CBSE Board Exam',
        'icon': 'asset/images/examCategoryIcon/cbse 12.png',
        'Quizs': '120+ Quizs',
        'color': Color(0xffF3E8FF) // Convert the int to a Color object
      },
      {
        'title': 'Class 10 Boards',
        'subtitle': 'CBSE Board Exam',
        'icon': 'asset/images/examCategoryIcon/cbse 10.png',
        'Quizs': '90+ Quizs',
        'color': Color(0xffFFEDD5) // Convert the int to a Color object
      },
    ];

    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const CustomAppBar(
          title: 'Practice & Quiz',
          showAvatar: true,
          notificationIcon: 'asset/images/notificationIcon.png',
          searchIcon: 'asset/images/searchImage.png',
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 25.h),
          child: Column(
            children: [
              Text(
                'Choose your exam category to start practicing',
                style: CustomTextStyle.bodyNormal
                    .copyWith(color: Color(0xff4B5563)),
              ),
              SizedBox(
                height: 24.h,
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: quiz.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.9,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      crossAxisCount: 2),
                  itemBuilder: (BuildContext context, int index) {
                    return examCategory(
                        quiz[index]['color'],
                        quiz[index]['icon'],
                        quiz[index]['title'],
                        quiz[index]['subtitle'],
                        quiz[index]['Quizs'], () {
                      Get.toNamed(RouteName.quizsLevels);
                    });
                  },
                ),
              )
            ],
          ),
        ));
  }
}

Widget examCategory(Color color, String image, String title, String subtitle,
    String quiz, VoidCallback onTap) {
  return Container(
    height: 167.h,
    decoration: BoxDecoration(color: Colors.white),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 17.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 48.h,
                width: 35.w,
                padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 8.h),
                decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.all(Radius.circular(8.r))),
                child: Image(
                  image: AssetImage(image),
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                width: 12.w,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: CustomTextStyle.bodyNormal.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    Text(subtitle,
                        style: CustomTextStyle.caption
                            .copyWith(color: Color(0xff6B7280)))
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            quiz,
            style:
                CustomTextStyle.bodyNormal.copyWith(color: Color(0xff4B5563)),
          ),
          Spacer(),
          customButton(
              backgroundColor: AppConstant.buttonColor,
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 21.w),
              title: 'Start Practice',
              onPressed: onTap,
              style: CustomTextStyle.bodyNormal.copyWith(
                color: Colors.white,
                fontSize: 14.sp,
              ))
        ],
      ),
    ),
  );
}
