import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:study_hub/Constants/constant.dart';
import 'package:study_hub/Route/RouteName.dart';
import 'package:study_hub/View/Quiz/QuizLevels/QuizController/quizController.dart';
import 'package:study_hub/Widget/CustomButton.dart';
import 'package:study_hub/Widget/TextStyle.dart';
import 'package:study_hub/Widget/appBar.dart';

class StartQuiz extends StatelessWidget {
  const StartQuiz({super.key});

  @override
  Widget build(BuildContext context) {
    final QuizController controller = Get.put(QuizController());

    return Scaffold(
      backgroundColor: AppConstant.appBackGround,
      appBar: CustomAppBar(
        showAvatar: true,
        title: 'Question 1/10',
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Question ${controller.questionIndex}',
                  style: CustomTextStyle.BodyBold.copyWith(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                Text(
                  '${controller.questionIndex} of ${controller.totalQuestions}',
                  style: CustomTextStyle.bodyNormal
                      .copyWith(color: const Color(0xff6B7280)),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Text(
              'What is the capital of France?',
              style: CustomTextStyle.BodyBold.copyWith(
                  fontSize: 18.sp, color: Colors.black),
            ),
            SizedBox(height: 8.h),
            Obx(() {
              return LinearProgressIndicator(
                value: controller.progress,
                color: AppConstant.buttonColor,
                backgroundColor: Colors.grey[300],
                minHeight: 8,
              );
            }),
            SizedBox(height: 24.h),
            QuizOption(text: 'Paris', value: 1),
            QuizOption(text: 'Berlin', value: 2),
            QuizOption(text: 'Madrid', value: 3),
            QuizOption(text: 'Rome', value: 4),
            SizedBox(
              height: 24.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                customButton(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 21.w),
                    backgroundColor: Color(0xff6B7280),
                    icon: Icons.arrow_back,
                    title: 'Previous',
                    onPressed: () {},
                    style: CustomTextStyle.bodyNormal
                        .copyWith(fontSize: 18.sp, color: Colors.white)),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteName.quizResult);
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 38.w, vertical: 10.h),
                    decoration: BoxDecoration(
                        color: AppConstant.buttonColor,
                        borderRadius: BorderRadius.all(Radius.circular(8.r))),
                    child: Row(
                      children: [
                        Text('Next',
                            style: CustomTextStyle.bodyNormal.copyWith(
                                fontSize: 18.sp, color: Colors.white)),
                        SizedBox(
                          width: 8.w,
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class QuizOption extends StatelessWidget {
  final String text;
  final int value;

  const QuizOption({
    super.key,
    required this.text,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final QuizController controller = Get.find();

    return Obx(() {
      bool isSelected = controller.selectedOption.value == value;

      return Container(
        margin: EdgeInsets.symmetric(vertical: 8.h),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: isSelected ? AppConstant.buttonColor : Colors.grey,
          ),
        ),
        child: Row(
          children: [
            Radio<int>(
              value: value,
              groupValue: controller.selectedOption.value,
              onChanged: (int? newValue) {
                controller.selectOption(newValue!);
              },
              activeColor: AppConstant.buttonColor,
            ),
            Text(
              text,
              style: CustomTextStyle.bodyNormal.copyWith(
                color: Colors.black,
              ),
            ),
          ],
        ),
      );
    });
  }
}
