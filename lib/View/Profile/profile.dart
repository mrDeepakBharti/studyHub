import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:study_hub/Constants/constant.dart';
import 'package:study_hub/Route/RouteName.dart';
import 'package:study_hub/Service/dialog_helper.dart';
import 'package:study_hub/View/EditProfile/EditProfileController/editPorfileController.dart';
import 'package:study_hub/View/Profile/controller/profileController.dart';
import 'package:study_hub/Widget/TextStyle.dart';
import 'package:study_hub/Widget/appBar.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  ProfileController controller = Get.put(ProfileController());
  Editporfilecontroller editporfilecontroller =
      Get.put(Editporfilecontroller());

  @override
  void initState() {
    controller.getProfileData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> achieve = [
      {
        'icon': 'asset/images/achievement/Gold.png',
        'title': 'Gold',
        'color': const Color(0xffFEF9C3)
      },
      {
        'icon': 'asset/images/achievement/Silver.png',
        'title': 'Silver',
        'color': const Color(0xffF3F4F6)
      },
      {
        'icon': 'asset/images/achievement/Bronze.png',
        'title': 'Bronze',
        'color': const Color(0xffFFEDD5)
      },
      {
        'icon': 'asset/images/achievement/Expert.png',
        'title': 'Expert',
        'color': const Color(0xffDBEAFE)
      },
    ];
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const CustomAppBar(
          showBackButton: true,
          title: 'Profile',
          showAvatar: false,
          notificationIcon: 'asset/images/notificationIcon.png',
          searchIcon: 'asset/images/searchImage.png',
        ),
        body: Obx(() {
          if (controller.isLoading.value) {
            return shimmerProfile();
          } else if (controller.profileDataRx.value == null) {
            return Center(
              child: Text(
                'No data found',
                style: CustomTextStyle.bodyNormal
                    .copyWith(color: Colors.black, fontSize: 15.sp),
              ),
            );
          } else {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              child: Container(
                height: Get.height,
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 25.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Row(
                          children: [
                            Obx(() {
                              return CircleAvatar(
                                radius: 40.r,
                                backgroundImage: (controller.profileDataRx.value
                                                ?.user?.profileUrl !=
                                            null &&
                                        controller.profileDataRx.value!.user!
                                            .profileUrl!.isNotEmpty)
                                    ? NetworkImage(controller
                                        .profileDataRx.value!.user!.profileUrl!)
                                    : (editporfilecontroller
                                                    .profileImage.value !=
                                                null
                                            ? FileImage(File(
                                                editporfilecontroller
                                                    .profileImage.value!.path))
                                            : const AssetImage(
                                                'asset/images/profile.png'))
                                        as ImageProvider,
                              );
                            }),
                            SizedBox(
                              width: 16.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.profileDataRx.value!.user!.name!,
                                  style: CustomTextStyle.BodyBold.copyWith(
                                      fontSize: 20.sp, color: Colors.black),
                                ),
                                Text(
                                  controller
                                      .profileDataRx.value!.user!.education!,
                                  style: CustomTextStyle.BodyBold.copyWith(
                                      fontSize: 12.sp,
                                      color: const Color(0xff6B7280)),
                                ),

                                //Todo Bio is not come in this List
                                Text(
                                  controller.profileDataRx.value!.user!.bio!,
                                  style: CustomTextStyle.bodyNormal.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff6B7280)),
                                ),
                              ],
                            )
                          ],
                        ),
                        Positioned(
                          bottom: 0,
                          left: 50.w,
                          child: GestureDetector(
                            onTap: () {
                              editporfilecontroller
                                  .pickImage(); // Trigger image picker
                            },
                            child: Image.asset(
                              'asset/images/editImage.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          height: 37.h,
                          width: 30.w,
                        ),
                        Positioned(
                          top: 2.h,
                          right: 2.w,
                          child: GestureDetector(
                              onTap: () {
                                Get.toNamed(RouteName.editProfile);
                              },
                              child: Icon(Icons.edit)),
                          height: 25.h,
                          width: 25.w,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 17.h,
                    ),
                    Divider(
                      color: const Color(0xff6B7280).withOpacity(0.2),
                    ),
                    SizedBox(
                      height: 17.h,
                    ),
                    Text(
                      'Statistics',
                      style: CustomTextStyle.BodyBold.copyWith(
                          fontSize: 18.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 12.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        scoreContainer(
                            '${controller.profileDataRx.value!.user!.quizCount!}',
                            'Quizzes'),
                        SizedBox(width: 10.w),
                        scoreContainer(
                            '${controller.profileDataRx.value!.user!.accuracy!}%',
                            'Accuracy'),
                        SizedBox(width: 10.w),
                        scoreContainer(
                            '${controller.profileDataRx.value!.user!.points!}',
                            'Points'),
                      ],
                    ),
                    SizedBox(
                      height: 31.h,
                    ),
                    Text(
                      'Achievements',
                      style: CustomTextStyle.BodyBold.copyWith(
                          fontSize: 18.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    SizedBox(
                      height: 110.h,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.profileDataRx.value!.achievements!
                            .toMap()
                            .length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Get.toNamed(
                                RouteName.achievment,
                                arguments: {'filter': achieve[index]['title']},
                              );
                            },
                            child: achievement(
                                achieve[index]['icon'],
                                achieve[index]['title'],
                                achieve[index]['color']),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(width: 12.w);
                        },
                      ),
                    ),
                    Text(
                      'Recent Activity',
                      style: CustomTextStyle.BodyBold.copyWith(
                          fontSize: 18.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 12.h),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(
                            70.r), // Large value for circular shape
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 16.h),
                            decoration: const BoxDecoration(
                              color: Color(0xffDCFCE7),
                            ),
                            child: const Icon(
                              Icons.check,
                              color: Color(0xff16A34A),
                            )),
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Mathematics Quiz',
                            style: CustomTextStyle.bodyNormal.copyWith(
                                fontWeight: FontWeight.w700,
                                color: Colors.black),
                          ),
                          Text(
                            'Completed with 95%',
                            style: CustomTextStyle.bodyNormal.copyWith(
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff6B7280)),
                          ),
                        ],
                      ),
                      trailing: Text(
                        '2h ago',
                        style: CustomTextStyle.bodyNormal.copyWith(
                          color: const Color(0xff6B7280),
                        ),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(
                            70.r), // Large value for circular shape
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 16.h),
                            decoration: const BoxDecoration(
                              color: Color(0xffDBEAFE),
                            ),
                            child: const Icon(
                              Icons.emoji_events,
                              color: Color(0xff2563EB),
                            )),
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Science Challenge',
                            style: CustomTextStyle.bodyNormal.copyWith(
                                fontWeight: FontWeight.w700,
                                color: Colors.black),
                          ),
                          Text(
                            'Won Gold Medal',
                            style: CustomTextStyle.bodyNormal.copyWith(
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff6B7280)),
                          ),
                        ],
                      ),
                      trailing: Text(
                        '1d ago',
                        style: CustomTextStyle.bodyNormal.copyWith(
                          color: const Color(0xff6B7280),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }
        }));
  }
}

Widget scoreContainer(String score, String title) {
  return Container(
    decoration: BoxDecoration(
        color: const Color(0xffF9FAFB),
        borderRadius: BorderRadius.all(Radius.circular(8.r))),
    padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 15.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          score,
          style: CustomTextStyle.BodyBold.copyWith(
              fontSize: 20.sp, color: AppConstant.buttonColor),
        ),
        Text(
          title,
          style: CustomTextStyle.bodyNormal.copyWith(),
        )
      ],
    ),
  );
}

Widget achievement(String icon, String title, Color color) {
  return Column(
    children: [
      ClipRRect(
        borderRadius:
            BorderRadius.circular(100.r), // Large value for circular shape
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 23.h),
          decoration: BoxDecoration(
            color: color,
          ),
          child: Image.asset(
            icon,
            fit: BoxFit.contain,
            height: 22.h,
            width: 20.w,
          ),
        ),
      ),
      SizedBox(
        height: 5.h,
      ),
      Text(
        title,
        style: CustomTextStyle.caption.copyWith(color: const Color(0xff6B7280)),
      )
    ],
  );
}
