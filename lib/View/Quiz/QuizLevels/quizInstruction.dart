import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:study_hub/Constants/constant.dart';
import 'package:study_hub/Route/RouteName.dart';
import 'package:study_hub/Widget/CustomButton.dart';
import 'package:study_hub/Widget/TextStyle.dart';
import 'package:study_hub/Widget/appBar.dart';
import 'package:study_hub/utils/sharedPreference/localDatabase.dart';

class Quizinstruction extends StatefulWidget {
  const Quizinstruction({super.key});

  @override
  State<Quizinstruction> createState() => _QuizinstructionState();
}

class _QuizinstructionState extends State<Quizinstruction> {
  var quizId = Get.arguments['id'];
  var quizLevel = Get.arguments['quizLevel'];

  @override
  void initState() {
    kLogger.i(quizId.toString());
    kLogger.d(quizLevel.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Quiz Instructions',
        showAvatar: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 41.w, vertical: 41.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Level ${quizLevel} Quiz Rules',
              style: CustomTextStyle.BodyBold.copyWith(
                  color: Colors.black, fontSize: 20.sp),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(
                CupertinoIcons.clock_fill,
                color: AppConstant.buttonColor,
              ),
              title: Text('You have 1 minute to complete each question',
                  style: CustomTextStyle.bodyNormal
                      .copyWith(color: Color(0xff4B5563))),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(
                CupertinoIcons.star_fill,
                color: AppConstant.buttonColor,
              ),
              title: Text('Score more than 6 points to unlock Level 2',
                  style: CustomTextStyle.bodyNormal
                      .copyWith(color: Color(0xff4B5563))),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(
                CupertinoIcons.check_mark_circled_solid,
                color: AppConstant.buttonColor,
              ),
              title: Text('Each correct answer gives you 1 point',
                  style: CustomTextStyle.bodyNormal
                      .copyWith(color: Color(0xff4B5563))),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(
                CupertinoIcons.clear_thick_circled,
                color: AppConstant.buttonColor,
              ),
              title: Text('No negative marking for wrong answers',
                  style: CustomTextStyle.bodyNormal
                      .copyWith(color: Color(0xff4B5563))),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(
                CupertinoIcons.gobackward,
                color: AppConstant.buttonColor,
              ),
              title: Text('You cannot go back to previous questions',
                  style: CustomTextStyle.bodyNormal
                      .copyWith(color: Color(0xff4B5563))),
            ),
            SizedBox(
              height: 40.h,
            ),
            customButton(
                backgroundColor: AppConstant.buttonColor,
                padding:
                    EdgeInsets.symmetric(horizontal: 106.w, vertical: 16.h),
                title: 'Start Quiz',
                onPressed: () {
                  Get.toNamed(RouteName.startQuiz, arguments: {'id': quizId});
                },
                style: CustomTextStyle.bodyNormal
                    .copyWith(fontSize: 18.sp, color: Colors.white))
          ],
        ),
      ),
    );
  }
}

Widget instruction(String image, String title) {
  return ListTile(
    leading: Image.asset(
      image,
      height: 14.h,
      width: 14.w,
    ),
    title: Text(
      title,
      style: CustomTextStyle.bodyNormal.copyWith(color: Color(0xff4B5563)),
    ),
  );
}
