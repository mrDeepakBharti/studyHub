import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:study_hub/Constants/constant.dart';
import 'package:study_hub/Route/RouteName.dart';
import 'package:study_hub/Service/dialog_helper.dart';
import 'package:study_hub/View/Quiz/QuizLevels/QuizController/quizController.dart';
import 'package:study_hub/Widget/CustomButton.dart';
import 'package:study_hub/Widget/TextStyle.dart';
import 'package:study_hub/Widget/appBar.dart';
import 'package:study_hub/utils/sharedPreference/localDatabase.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  QuizController quizController = Get.put(QuizController());
  @override
  void initState() {
    quizController.getPracticeQuiz();
    super.initState();
    // Set the density for the app
  }

  Color _parseColor(String? colorString) {
    // Use default color if the string is null or empty
    if (colorString == null || colorString.isEmpty) {
      return const Color(0xff000000); // Default black color
    }

    // Ensure the string has the '0xff' prefix for ARGB format
    if (!colorString.startsWith('0xff')) {
      colorString = '0xff$colorString';
    }

    try {
      return Color(int.parse(colorString));
    } catch (e) {
      // Handle invalid color format gracefully
      print('Invalid color format: $colorString');
      return const Color(0xff000000); // Default fallback color
    }
  }

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
              // Obx(() {
              //   if (quizController.isLoading.value) {
              //     return shimmerQuizCategory();
              //   } else {
              //     return Expanded(
              //       child: GridView.builder(
              //         itemCount: quizController.quizCategory.length,
              //         gridDelegate:
              //             const SliverGridDelegateWithFixedCrossAxisCount(
              //                 childAspectRatio: 0.9,
              //                 mainAxisSpacing: 16,
              //                 crossAxisSpacing: 16,
              //                 crossAxisCount: 2),
              //         itemBuilder: (BuildContext context, int index) {
              //           var quizData = quizController.quizCategory[index];

              //           kLogger.f(quizData);
              //           return examCategory(
              //               quiz[index]['color'],
              //               quiz[index]['icon'],
              //               quiz[index]['title'],
              //               quiz[index]['subtitle'],
              //               quiz[index]['Quizs'], () {
              //             Get.toNamed(RouteName.quizsLevels);
              //           });
              //         },
              //       ),
              //     );
              //   }
              // })
              Obx(() {
                if (quizController.isLoading.value) {
                  return Expanded(
                    child: GridView.builder(
                      itemCount: 4,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.9,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        // Access the Datum object directly

                        // Pass Datum properties to your widget
                        return shimmerQuizCategory();
                      },
                    ),
                  );
                } else {
                  return Expanded(
                    child: GridView.builder(
                      itemCount: quizController.quizCategory.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.9,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        // Access the Datum object directly
                        var quizData = quizController.quizCategory[index];

                        // Log the data for debugging
                        kLogger.f(quizData);

                        // Pass Datum properties to your widget
                        return examCategory(
                          _parseColor(
                              quizData?.color), // Convert string to Color
                          quizData?.icon ?? '', // Use default if null
                          quizData?.title ?? 'No Title', // Title
                          quizData?.subTitle ?? 'No Subtitle', // Subtitle
                          '${quizData?.quizCount ?? 0} Quizzes', // Quiz count
                          () {
                            Get.toNamed(RouteName.quizsLevels, arguments: {
                              'id': quizData?.id,
                            });
                          },
                        );
                      },
                    ),
                  );
                }
              })
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
                  image: NetworkImage(image),
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
