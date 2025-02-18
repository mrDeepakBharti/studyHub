import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:study_hub/Constants/constant.dart';
import 'package:study_hub/Route/RouteName.dart';
import 'package:study_hub/Service/dialog_helper.dart';
import 'package:study_hub/View/Quiz/QuizLevels/QuizController/quizController.dart';
import 'package:study_hub/Widget/TextStyle.dart';
import 'package:study_hub/Widget/appBar.dart';
import 'package:study_hub/utils/sharedPreference/localDatabase.dart';

class Quizlevels extends StatefulWidget {
  Quizlevels({super.key});

  @override
  State<Quizlevels> createState() => _QuizlevelsState();
}

class _QuizlevelsState extends State<Quizlevels> {
  QuizController quizController = Get.put(QuizController());
  var id = Get.arguments['id'];

  @override
  void initState() {
    // kLogger.i(quizController.quizLevel.first.toString());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      quizController.getQuizLevel(id!);
      kLogger.f(quizController.quizLevel.toString());
      // Add Your Code here.
    });
    kLogger.d("id Recieve----->${id.toString()}");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // List<Map<String, dynamic>> quizLevels = [
    //   {
    //     'level': 'Level 1',
    //     'type': 'Basic Physics',
    //     'points': '0/100',
    //     'isCompleted': true
    //   },
    //   {
    //     'level': 'Level 2',
    //     'type': 'Advanced Physics',
    //     'points': '0/100',
    //     'isCompleted': false
    //   },
    //   {
    //     'level': 'Level 3',
    //     'type': 'Quantum Physics',
    //     'points': '0/100',
    //     'isCompleted': false
    //   },
    // ];
    return Scaffold(
        backgroundColor: AppConstant.appBackGround,
        appBar: CustomAppBar(
          showBackButton: true,
          title: 'Quiz Levels',
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              Obx(() {
                if (quizController.isLoading.value) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return QuizLevelShimmer();
                      },
                    ),
                  );
                } else if (quizController.quizLevel.isEmpty) {
                  return Center(
                    child: Text(
                      'No Quiz Level Found',
                      style: TextStyle(color: Colors.black),
                    ),
                  );
                } else {
                  return Expanded(
                    child: ListView.builder(
                        itemCount: quizController.quizLevel.length,
                        itemBuilder: (BuildContext context, int index) {
                          var quizData = quizController.quizLevel[index];
                          kLogger
                              .t("QuizData Tile:${quizData.name.toString()}");
                          return Padding(
                            padding: EdgeInsets.only(top: 20.h),
                            child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.w, vertical: 10.h),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.r))),
                                child: QuizLevel(
                                    quizData.level.toString(),
                                    quizData.name ?? "",
                                    quizData.points.toString(),
                                    quizData.unlocked ?? false,
                                    (index + 1).toString(), () {
                                  Get.toNamed(RouteName.quizInstruction,
                                      arguments: {
                                        'quizLevel': index + 1,
                                        'id': quizData.id,
                                      });
                                }, quizData.score.toString())),
                          );
                        }),
                  );
                }
              })
            ],
          ),
        ));
  }
}

Widget QuizLevel(String level, String type, String points, bool isCompleted,
    String index, VoidCallback onTap, String score) {
  return ListTile(
    contentPadding: EdgeInsets.zero,
    leading: ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(
          100.r)), // Ensure this is high enough to form a circle
      child: Container(
        color: isCompleted ? Color(0xffDCFCE7) : Color(0xffF3F4F6),
        width:
            48.h, // Set the width and height to be equal for a perfect circle
        height: 48.h,
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 14.w),
        child: isCompleted
            ? Image.asset(
                'asset/images/lockOpen.png',
                fit: BoxFit.contain,
              )
            : Image.asset(
                'asset/images/lockClose.png',
                fit: BoxFit.contain,
              ),
      ),
    ),
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isCompleted
            ? Text("Level $level",
                style: CustomTextStyle.BodyBold.copyWith(
                  color: Colors.black,
                ))
            : Text(
                "Level $level",
                style: CustomTextStyle.BodyBold.copyWith(
                  color: Color(0xff4B5563),
                ),
              ),
        isCompleted
            ? Text(
                type,
                style: CustomTextStyle.bodyNormal
                    .copyWith(color: Color(0xff4B5563)),
              )
            : Text(
                type,
                style: CustomTextStyle.bodyNormal
                    .copyWith(color: Color(0xff6B7280)),
              ),
        isCompleted
            ? Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Color(0xffFACC15),
                    size: 14.sp,
                  ),
                  Text(
                    " ${score}/${points}",
                    style: CustomTextStyle.bodyNormal
                        .copyWith(color: Color(0xff6B7280)),
                  ),
                ],
              )
            : Text(
                'Complete Level ${index} to unlock',
                style: CustomTextStyle.bodyNormal
                    .copyWith(color: Color(0xffEF4444)),
              )
      ],
    ),
    trailing: isCompleted
        ? GestureDetector(
            onTap: onTap,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.r)),
                  color: AppConstant.buttonColor),
              child: Text('Start',
                  style:
                      CustomTextStyle.bodyNormal.copyWith(color: Colors.white)),
            ),
          )
        : Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
                color: Color(0xffD1D5DB)),
            child: Text('Locked',
                style: CustomTextStyle.bodyNormal
                    .copyWith(color: Color(0xff6B7280))),
          ),
  );
}


/*ListTile(
                              leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(70.r),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 15.w, vertical: 14.h),
                                    decoration:
                                        BoxDecoration(color: Color(0xffDCFCE7)),
                                    child: Icon(
                                      Icons.lock_open,
                                      color: Colors.green,
                                    ),
                                  )),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(quizLevels[index]['level'],
                                      style: CustomTextStyle.BodyBold.copyWith(
                                        color: Colors.black,
                                      )),
                                  Text(
                                    quizLevels[index]['type'],
                                    style: CustomTextStyle.bodyNormal
                                        .copyWith(color: Color(0xff4B5563)),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Color(0xffFACC15),
                                        size: 14.sp,
                                      ),
                                      Text(
                                        quizLevels[index]['points'],
                                        style: CustomTextStyle.bodyNormal
                                            .copyWith(color: Color(0xff6B7280)),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              trailing: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15.w, vertical: 8.h),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.r)),
                                    color: AppConstant.buttonColor),
                                child: Text('Submit',
                                    style: CustomTextStyle.bodyNormal
                                        .copyWith(color: Colors.white)),
                              )
                              ),*/