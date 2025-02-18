import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:shimmer/shimmer.dart';
import 'package:study_hub/utils/sharedPreference/localDatabase.dart';

class DialogHelper {
  static void showErrorDialog(
      {String title = 'Error', String? description = 'Something went wrong'}) {
    EasyLoading.showError(description.toString(),
        dismissOnTap: false, maskType: EasyLoadingMaskType.black);
  }

  static void showLoading([String? message]) {
    Future.delayed(Duration.zero, () {
      Get.dialog(
        WillPopScope(
          onWillPop: () async =>
              false, // Prevent dialog dismissal on back button press
          child: const Center(
            child: Padding(
              padding: EdgeInsets.all(20.0), // Adjust padding as needed
              child: SizedBox(
                height: 40,
                width: 40,
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        ),
        barrierDismissible: false,
      );
    });
  }

  static void hideLoading() {
    kLogger.i("Loading Stopped....");
    if (Get.isDialogOpen == true) {
      Get.back();
    }
  }
}

Widget shimmerProfile() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
    child: Container(
      height: Get.height,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 25.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Shimmer effect for the profile section
          Stack(
            children: [
              Row(
                children: [
                  // Shimmer effect for profile image
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: CircleAvatar(
                      radius: 40.r,
                      backgroundColor: Colors.grey[300],
                    ),
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Shimmer effect for name
                      Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          width: 150.w,
                          height: 20.h,
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6.r))),
                        ),
                      ),
                      // Shimmer effect for university name
                      SizedBox(
                        height: 10.h,
                      ),
                      Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          width: 200.w,
                          height: 15.h,
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6.r))),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // Shimmer effect for the edit button
              // Positioned(
              //   bottom: 0,
              //   left: 50.w,
              //   child: Shimmer.fromColors(
              //     baseColor: Colors.grey[300]!,
              //     highlightColor: Colors.grey[100]!,
              //     child: Container(
              //       width: 30.w,
              //       height: 37.h,
              //       color: Colors.grey[300],
              //     ),
              //   ),
              // ),
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
          // Shimmer effect for Statistics section title
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              width: 100.w,
              height: 20.h,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.all(Radius.circular(6.r))),
            ),
          ),
          SizedBox(height: 12.h),
          // Shimmer effect for statistics (e.g., quizzes, accuracy, points)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              shimmerScoreContainer(),
              SizedBox(width: 10.w),
              shimmerScoreContainer(),
              SizedBox(width: 10.w),
              shimmerScoreContainer(),
            ],
          ),
          SizedBox(
            height: 31.h,
          ),
          // Shimmer effect for Achievements section title
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              width: 100.w,
              height: 20.h,
              color: Colors.grey[300],
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          // Shimmer effect for achievements list
          SizedBox(
            height: 110.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 5, // Fake data for shimmer effect
              itemBuilder: (BuildContext context, int index) {
                return shimmerAchievement();
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(width: 12.w);
              },
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          // Shimmer effect for Recent Activity section title
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              width: 150.w,
              height: 20.h,
              color: Colors.grey[300],
            ),
          ),
          SizedBox(height: 12.h),
          // Shimmer effect for ListTile (recent activity)
          shimmerListTile(),
          SizedBox(height: 12.h),
          shimmerListTile(),
        ],
      ),
    ),
  );
}

Widget shimmerScoreContainer() {
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
    child: Container(
      width: 80.w,
      height: 60.h,
      decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.all(Radius.circular(6.r))),
    ),
  );
}

Widget shimmerAchievement() {
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
    child: Container(
      width: 80.w,
      height: 80.h,
      decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.all(Radius.circular(6.r))),
    ),
  );
}

Widget shimmerListTile() {
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
    child: ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        width: 40.w,
        height: 40.h,
        decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.all(Radius.circular(6.r))),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 150.w,
            height: 20.h,
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.all(Radius.circular(6.r))),
          ),
          SizedBox(height: 5.h),
          Container(
            width: 100.w,
            height: 15.h,
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.all(Radius.circular(6.r))),
          ),
        ],
      ),
      trailing: Container(
        width: 50.w,
        height: 15.h,
        decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.all(Radius.circular(6.r))),
      ),
    ),
  );
}

Widget shimmerTab() {
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
    child: Container(
      width: 100.w,
      height: 40.h,
      margin: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8.r)),
        color: Colors.white,
      ),
    ),
  );
}

Widget shimmerQuizCategory() {
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
              Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  height: 48.h,
                  width: 35.w,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.all(Radius.circular(8.r)),
                  ),
                ),
              ),
              SizedBox(
                width: 12.w,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                        height: 14.h,
                        width: 100.w,
                        color: Colors.grey.shade300,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                        height: 12.h,
                        width: 80.w,
                        color: Colors.grey.shade300,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 12.h),
          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              height: 12.h,
              width: 120.w,
              color: Colors.grey.shade300,
            ),
          ),
          Spacer(),
          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              height: 40.h,
              width: 150.w,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget shimmerSubjectContainer() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
    child: Card(
      elevation: 0.5,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 17.0, vertical: 17.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          border: Border.all(color: Color(0xffE5E7EB)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                ),
              ),
              title: Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: 16.0,
                  width: 100.0,
                  color: Colors.grey,
                ),
              ),
              trailing: Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: 16.0,
                  width: 16.0,
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            ...List.generate(3, (index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 12.0),
                child: Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    ),
  );
}

Widget QuizLevelShimmer() {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 20.h),
    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8.r))),
    child: Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(100.r)),
          child: Container(
            color: Colors.grey[300],
            width: 48.h,
            height: 48.h,
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100.w,
              height: 16.h,
              color: Colors.grey[300],
            ),
            SizedBox(height: 5.h),
            Container(
              width: 80.w,
              height: 14.h,
              color: Colors.grey[300],
            ),
            SizedBox(height: 5.h),
            Container(
              width: 60.w,
              height: 14.h,
              color: Colors.grey[300],
            ),
          ],
        ),
        trailing: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
            color: Colors.grey[300],
          ),
          width: 70.w,
          height: 30.h,
        ),
      ),
    ),
  );
}
