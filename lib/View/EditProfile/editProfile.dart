import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:study_hub/Constants/constant.dart';
import 'package:study_hub/View/EditProfile/EditProfileController/editPorfileController.dart';
import 'package:study_hub/Widget/CustomButton.dart';
import 'package:study_hub/Widget/TextStyle.dart';
import 'package:study_hub/Widget/appBar.dart';
import 'package:study_hub/Widget/customTextFeild.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    Editporfilecontroller controller = Get.put(Editporfilecontroller());

    Widget _buildChips() {
      return Obx(() => Wrap(
            spacing: 8.0,
            children: controller.chips
                .map((chip) => Chip(
                      backgroundColor: Color(0xffF3F4F6),
                      label: Text(chip),
                      deleteIcon: const Icon(Icons.close),
                      onDeleted: () => controller.removeChip(chip),
                    ))
                .toList(),
          ));
    }

    return Scaffold(
      backgroundColor: AppConstant.appBackGround,
      appBar: const CustomAppBar(
        showBackButton: true,
        title: 'Profile',
        showAvatar: false,
        notificationIcon: 'asset/images/notificationIcon.png',
        searchIcon: 'asset/images/searchImage.png',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 16.h,
              ),
              // Center(
              //   child: Stack(
              //     children: [

              //       CircleAvatar(
              //         radius: 40.r,
              //         backgroundImage:
              //             const AssetImage('asset/images/profile.png'),
              //       ),
              //       Positioned(
              //         bottom: 0.h,
              //         right: 0.w,
              //         child: Image.asset(
              //           'asset/images/editImage.png',
              //           height: 37.h,
              //           width: 30.w,
              //         ),
              //       )
              //     ],
              //   ),
              // ),
              // Center(
              //   child: Stack(
              //     children: [
              //       // Display the picked image, or a default image if none is selected
              //       Obx(() {
              //         return CircleAvatar(
              //           radius: 40.r,
              //           backgroundImage: controller.profileImage.value != null
              //               ? FileImage(
              //                   File(controller.profileImage.value!.path))
              //               : const AssetImage('asset/images/profile.png')
              //                   as ImageProvider,
              //         );
              //       }),
              //       Positioned(
              //         bottom: 0.h,
              //         right: 0.w,
              //         child: GestureDetector(
              //           onTap: () {
              //             controller.pickImage(); // Trigger image picker
              //           },
              //           child: Image.asset(
              //             'asset/images/editImage.png',
              //             height: 37.h,
              //             width: 30.w,
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),

              SizedBox(
                height: 16.h,
              ),
              Text(
                'Full Name',
                style: CustomTextStyle.BodyBold.copyWith(
                  color: const Color(0xff374151),
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              CustomTextInputField(
                  textInputAction: TextInputAction.next,
                  hintText: 'Enter Name',
                  controller: controller.fullName,
                  obscureText: false,
                  mandatoryField: true),
              SizedBox(
                height: 16.h,
              ),
              Text(
                'Education',
                style: CustomTextStyle.BodyBold.copyWith(
                  color: const Color(0xff374151),
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              CustomTextInputField(
                  textInputAction: TextInputAction.next,
                  hintText: 'Enter Education',
                  controller: controller.education,
                  obscureText: false,
                  mandatoryField: true),
              SizedBox(
                height: 16.h,
              ),
              Text(
                'Email',
                style: CustomTextStyle.BodyBold.copyWith(
                  color: const Color(0xff374151),
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              CustomTextInputField(
                  textInputAction: TextInputAction.next,
                  hintText: 'Enter Email',
                  controller: controller.email,
                  obscureText: false,
                  mandatoryField: true),
              SizedBox(
                height: 16.h,
              ),
              Text(
                'Bio',
                style: CustomTextStyle.BodyBold.copyWith(
                  color: const Color(0xff374151),
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              CustomTextInputField(
                  textInputAction: TextInputAction.next,
                  maxLines: 3,
                  minLines: 3,
                  hintText: 'Enter Bio',
                  controller: controller.bio,
                  obscureText: false,
                  mandatoryField: true),
              SizedBox(height: 16.h),
              Text('Interests',
                  style: TextStyle(
                      fontSize: 14.sp, color: const Color(0xff374151))),
              _buildChips(),
              GestureDetector(
                onTap: () => _showAddChipDialog(context),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15.r)),
                    color: const Color(0xffF3F4F6),
                  ),
                  padding:
                      EdgeInsets.symmetric(vertical: 7.h, horizontal: 12.w),
                  child: Text(
                    '+ Add',
                    style: TextStyle(fontSize: 16.sp, color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customButton(
                      backgroundColor: AppConstant.buttonColor,
                      padding:
                          EdgeInsets.symmetric(horizontal: 25.w, vertical: 8.h),
                      title: 'Save Changes',
                      onPressed: () {
                        controller.editProfile(
                            fullName: controller.fullName.text,
                            education: controller.education.text,
                            bio: controller.bio.text,
                            interests: controller.chips);
                      },
                      style: CustomTextStyle.bodyNormal
                          .copyWith(color: Colors.white)),
                  customButton(
                      borderWidth: 2,
                      borderColor: Color(0xffD1D5DB),
                      backgroundColor: Colors.white,
                      padding:
                          EdgeInsets.symmetric(horizontal: 49.w, vertical: 8.h),
                      title: 'Cancel',
                      onPressed: () {
                        Get.back();
                      },
                      style: CustomTextStyle.BodyBold.copyWith(
                          color: Colors.black))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

void _showAddChipDialog(BuildContext context) {
  Editporfilecontroller controller = Get.put(Editporfilecontroller());

  Get.defaultDialog(
    backgroundColor: Colors.white,
    title: 'Add Interest',
    content: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: TextField(
          inputFormatters: [LengthLimitingTextInputFormatter(30)],
          cursorColor: AppConstant.buttonColor,
          controller: controller.interestController,
          decoration: InputDecoration(
            hintText: 'Enter interest',
            focusColor: AppConstant.buttonColor,
          ),
        ),
      ),
    ),
    buttonColor: AppConstant.buttonColor,
    textCancel: 'Cancel',
    textConfirm: 'Add',
    confirmTextColor: Colors.white,
    onConfirm: () {
      controller.addChip(controller.interestController.text);
      Get.back();
    },
  );
}
