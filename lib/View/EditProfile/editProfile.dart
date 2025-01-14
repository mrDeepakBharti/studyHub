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

// class EditProfile extends StatelessWidget {
//   const EditProfile({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Editporfilecontroller editporfilecontroller =
//         Get.put(Editporfilecontroller());
//         void _showAddChipDialog(BuildContext context) {
//     Get.defaultDialog(
//       title: 'Add Interest',
//       content: TextField(
//         controller: editporfilecontroller.interestController,
//         decoration: InputDecoration(hintText: 'Enter interest'),
//       ),
//       textCancel: 'Cancel',
//       textConfirm: 'Add',
//       confirmTextColor: Colors.white,
//       onConfirm: () {
//         editporfilecontroller.addChip(editporfilecontroller.interestController.text);
//         Get.back();
//       },
//     );
//   }

//   Widget _buildChips() {
//     return Obx(() => Wrap(
//           spacing: 8.0,
//           children: editporfilecontroller.chips
//               .map((chip) => Chip(
//                     label: Text(chip),
//                     deleteIcon: Icon(Icons.close),
//                     onDeleted: () => editporfilecontroller.removeChip(chip),
//                   ))
//               .toList(),
//         ));
//   }

//     return Scaffold(
//       backgroundColor: AppConstant.appBackGround,
//       appBar: const CustomAppBar(
//         showBackButton: true,
//         title: 'Profile',
//         showAvatar: false,
//         notificationIcon: 'asset/images/notificationIcon.png',
//         searchIcon: 'asset/images/searchImage.png',
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 30.w),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Stack(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.only(top: 22.h),
//                         child: CircleAvatar(
//                           radius: 40.r,
//                           backgroundImage:
//                               AssetImage('asset/images/profile.png'),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Positioned(
//                     bottom: 0.h, // Adjust to fine-tune positioning
//                     right: 150.w,
//                     child: Image.asset(
//                       'asset/images/editImage.png',
//                       fit: BoxFit.cover,
//                     ),
//                     height: 37.h,
//                     width: 30.w,
//                   )
//                 ],
//               ),
//               SizedBox(
//                 height: 16.h,
//               ),
//               Text(
//                 'Full Name',
//                 style: CustomTextStyle.BodyBold.copyWith(
//                   color: Color(0xff374151),
//                   fontSize: 14.sp,
//                 ),
//               ),
//               SizedBox(
//                 height: 8.h,
//               ),
//               CustomTextInputField(
//                   textInputAction: TextInputAction.next,
//                   hintText: 'Enter Name',
//                   controller: editporfilecontroller.email,
//                   obscureText: false,
//                   mandatoryField: true),
//               SizedBox(
//                 height: 16.h,
//               ),
//               Text(
//                 'Education',
//                 style: CustomTextStyle.BodyBold.copyWith(
//                   color: Color(0xff374151),
//                   fontSize: 14.sp,
//                 ),
//               ),
//               SizedBox(
//                 height: 8.h,
//               ),
//               CustomTextInputField(
//                   textInputAction: TextInputAction.next,
//                   hintText: 'Enter Education',
//                   controller: editporfilecontroller.education,
//                   obscureText: false,
//                   mandatoryField: true),
//               SizedBox(
//                 height: 16.h,
//               ),
//               Text(
//                 'Email',
//                 style: CustomTextStyle.BodyBold.copyWith(
//                   color: Color(0xff374151),
//                   fontSize: 14.sp,
//                 ),
//               ),
//               SizedBox(
//                 height: 8.h,
//               ),
//               CustomTextInputField(
//                   textInputAction: TextInputAction.next,
//                   hintText: 'Enter Email',
//                   controller: editporfilecontroller.email,
//                   obscureText: false,
//                   mandatoryField: true),
//               SizedBox(
//                 height: 16.h,
//               ),
//               Text(
//                 'Bio',
//                 style: CustomTextStyle.BodyBold.copyWith(
//                   color: Color(0xff374151),
//                   fontSize: 14.sp,
//                 ),
//               ),
//               SizedBox(
//                 height: 8.h,
//               ),
//               CustomTextInputField(
//                   textInputAction: TextInputAction.next,
//                   maxLines: 3,
//                   minLines: 3,
//                   hintText: 'Enter Bio',
//                   controller: editporfilecontroller.email,
//                   obscureText: false,
//                   mandatoryField: true),
//               SizedBox(
//                 height: 8.h,
//               ),
//               Text(
//                 'Interests',
//                 style: CustomTextStyle.bodyNormal
//                     .copyWith(color: Color(0xff374151)),
//               ),
//               GestureDetector(

//                 child: Container(
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.all(Radius.circular(15.r)),
//                         color: Color(0xffF3F4F6)),
//                     padding:
//                         EdgeInsets.symmetric(vertical: 7.h, horizontal: 12.w),
//                     child: Text(
//                       '+ Add',
//                       style:
//                           CustomTextStyle.BodyBold.copyWith(color: Colors.black),
//                     )),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   customButton(
//                       backgroundColor: AppConstant.buttonColor,
//                       padding:
//                           EdgeInsets.symmetric(horizontal: 25.w, vertical: 8.h),
//                       title: 'Save Changes',
//                       onPressed: () {},
//                       style: CustomTextStyle.bodyNormal
//                           .copyWith(color: Colors.white)),
//                   customButton(
//                       borderWidth: 2,
//                       borderColor: Color(0xffD1D5DB),
//                       backgroundColor: Colors.white,
//                       padding:
//                           EdgeInsets.symmetric(horizontal: 49.w, vertical: 8.h),
//                       title: 'Cancel',
//                       onPressed: () {},
//                       style: CustomTextStyle.BodyBold.copyWith(
//                           color: Colors.black))
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

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
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 40.r,
                      backgroundImage:
                          const AssetImage('asset/images/profile.png'),
                    ),
                    Positioned(
                      bottom: 0.h,
                      right: 0.w,
                      child: Image.asset(
                        'asset/images/editImage.png',
                        height: 37.h,
                        width: 30.w,
                      ),
                    )
                  ],
                ),
              ),
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
                  controller: controller.email,
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
                  controller: controller.email,
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
                      onPressed: () {},
                      style: CustomTextStyle.bodyNormal
                          .copyWith(color: Colors.white)),
                  customButton(
                      borderWidth: 2,
                      borderColor: Color(0xffD1D5DB),
                      backgroundColor: Colors.white,
                      padding:
                          EdgeInsets.symmetric(horizontal: 49.w, vertical: 8.h),
                      title: 'Cancel',
                      onPressed: () {},
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
