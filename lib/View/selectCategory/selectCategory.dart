import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:study_hub/Constants/constant.dart';
import 'package:study_hub/Route/RouteName.dart';
import 'package:study_hub/View/selectCategory/controller/selectCategory.dart';
import 'package:study_hub/Widget/CustomButton.dart';
import 'package:study_hub/Widget/TextStyle.dart';

class selectCategory extends StatefulWidget {
  const selectCategory({super.key});

  @override
  State<selectCategory> createState() => _selectCategoryState();
}

class _selectCategoryState extends State<selectCategory> {
  categoryController controller = Get.put(categoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstant.appBackGround,
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
            child: Column(children: [
              Text(
                'Select Your Category',
                style: CustomTextStyle.bodyNormal.copyWith(
                    color: Color(0xff111827),
                    fontWeight: FontWeight.w600,
                    fontSize: 20.sp),
              ),
              SizedBox(
                height: 16.h,
              ),
              Obx(() => clasConatiner(
                  'asset/images/I@4x.png',
                  'School',
                  'Study materials from Class 6-12',
                  controller.isSelected.value == 'School')),
              SizedBox(height: 20.h),
              Obx(() => clasConatiner(
                  'asset/images/AuthImage/signup.png',
                  'College',
                  'Competitive exams and degree courses',
                  controller.isSelected.value == 'College')),
              Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30.h),
                child: customButton(
                    backgroundColor: AppConstant.buttonColor,
                    padding:
                        EdgeInsets.symmetric(horizontal: 143.w, vertical: 10.h),
                    title: 'Continue',
                    onPressed: () {
                      if (controller.isSelected.value.isNotEmpty) {
                        Get.offAllNamed(RouteName.bottomNav);
                      } else {
                        Get.snackbar(
                          'select a category',
                          'Select at least one category to continue',
                          duration: Duration(seconds: 2),
                        );
                      }
                    },
                    style: CustomTextStyle.bodyNormal.copyWith(
                      color: Colors.white,
                    )),
              )
            ])),
      ),
    );
  }
}

Widget clasConatiner(
    String image, String title, String description, bool isSelected) {
  categoryController controller = Get.put(categoryController());

  return GestureDetector(
    onTap: () {
      controller.selected(title);
    },
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: isSelected
              ? AppConstant.buttonColor
              : Colors.transparent, // Highlight when selected
          width: 2.w,
        ),
        borderRadius: BorderRadius.circular(10.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 70.w, vertical: 26.h),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40.r,
            backgroundColor: Color(0xffF3F4F6),
            child: Image.asset(
              image,
              height: 30.h,
              width: 26.w,
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            title,
            style: CustomTextStyle.bodyNormal.copyWith(
              color: Color(0xff111827),
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            description,
            textAlign: TextAlign.center,
            style: CustomTextStyle.bodyNormal.copyWith(
              color: Color(0xff4B5563),
            ),
          )
        ],
      ),
    ),
  );
}
