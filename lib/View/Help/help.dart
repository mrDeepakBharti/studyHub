import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:study_hub/Constants/constant.dart';
import 'package:study_hub/View/Help/helpController/helpController.dart';
import 'package:study_hub/Widget/CustomButton.dart';
import 'package:study_hub/Widget/TextStyle.dart';
import 'package:study_hub/Widget/appBar.dart';
import 'package:study_hub/Widget/customTextFeild.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Helpcontroller helpcontroller = Get.put(Helpcontroller());
    return Scaffold(
      backgroundColor: AppConstant.appBackGround,
      appBar: const CustomAppBar(
        showBackButton: true,
        title: 'Help',
        showAvatar: false,
        searchIcon: 'asset/images/searchImage.png',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonFormField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xffD1D5DB)),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xffD1D5DB)),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: const BorderSide(color: Color(0xffD1D5DB)),
                  ),
                  fillColor: Colors.white),
              dropdownColor: Colors.white,
              items: const [
                DropdownMenuItem(
                    value: 'Technical Issue', child: Text('Technical Issue')),
                DropdownMenuItem(
                    value: 'Add New Courses', child: Text('Add New Courses')),
                DropdownMenuItem(
                    value: 'Wrong Information',
                    child: Text('Wrong Information')),
                DropdownMenuItem(
                    value: 'Unable To Join Quiz',
                    child: Text('Unable To Join Quiz')),
              ],
              onChanged: (value) {},
              hint: Text(
                'Select Your Issue Type',
                style: CustomTextStyle.bodyNormal.copyWith(
                  color: Colors.black,
                  fontSize: 16.sp,
                ),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              'Description',
              style: CustomTextStyle.bodyNormal.copyWith(
                  fontWeight: FontWeight.w600, color: const Color(0xff374151)),
            ),
            SizedBox(
              height: 4.h,
            ),
            CustomTextInputField(
                textInputAction: TextInputAction.next,
                maxLines: 4,
                minLines: 4,
                hintText:
                    'Please describe your issue or suggestion in detail...',
                controller: helpcontroller.description,
                obscureText: false,
                mandatoryField: true),
            SizedBox(
              height: 16.h,
            ),
            Text(
              'Attachment (Optional)',
              style: CustomTextStyle.bodyNormal.copyWith(
                  fontWeight: FontWeight.w600, color: const Color(0xff374151)),
            ),
            SizedBox(
              height: 8.h,
            ),
            GestureDetector(
              onTap: () {},
              child: DottedBorder(
                borderType: BorderType.RRect,
                radius: Radius.circular(12.r),
                child: Container(
                  width: double.infinity,
                  height: 150.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.cloud_upload_outlined,
                        size: 50.sp,
                        color: Colors.grey,
                      ),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: 'Upload a file',
                            style: CustomTextStyle.bodyNormal.copyWith(
                                color: AppConstant.buttonColor,
                                fontWeight: FontWeight.w600)),
                        TextSpan(
                            text: ' or drag and drop',
                            style: CustomTextStyle.bodyNormal
                                .copyWith(color: Color(0xff4B5563)))
                      ])),
                      SizedBox(
                        height: 4.h,
                      ),
                      const Text(
                        'PNG, JPG, PDF up to 10MB',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Obx(() {
                  return Checkbox(
                      value: helpcontroller.isChecked.value,
                      onChanged: (bool? value) {
                        helpcontroller.isChecked.value = value!;
                      });
                }),
                Text(
                  'Send me a copy of my report',
                  style: CustomTextStyle.bodyNormal
                      .copyWith(color: Color(0xff111827)),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 5.h),
              child: customButton(
                  backgroundColor: AppConstant.buttonColor,
                  padding:
                      EdgeInsets.symmetric(horizontal: 84.w, vertical: 10.h),
                  title: 'Submit Request',
                  onPressed: () {},
                  style: CustomTextStyle.bodyNormal.copyWith(
                    color: Colors.white,
                  )),
            ),
            // Padding(
            //   padding: EdgeInsets.only(left: 22.w, top: 10.h),
            //   child: Text(
            //     'Frequently Asked Questions',
            //     style: CustomTextStyle.BodyBold.copyWith(
            //         fontSize: 18.sp, color: Color(0xff111827)),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
