import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:study_hub/Constants/constant.dart';
import 'package:study_hub/Route/RouteName.dart';
import 'package:study_hub/Widget/TextStyle.dart';
import 'package:study_hub/Widget/appBar.dart';

class NotificationAlert extends StatelessWidget {
  const NotificationAlert({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> notifiocationList = [
      {
        'title': 'NCERT Physics Book',
        'subtitle': 'Class 11 & 12 Complete Book',
        'image': 'asset/images/examCategoryIcon/jee.png',
        'color': Color(0xffDBEAFE),
        'Time': '2 hours ago',
        'conatinerColor': Color(0xffEFF6FF)
      },
      {
        'title': 'Physics Notes',
        'subtitle': 'Chapter-wise detailed notes',
        'image': 'asset/images/examCategoryIcon/bio.png',
        'color': Color(0xffDCFCE7),
        'Time': '5 hours ago',
        'conatinerColor': Color(0xffF0FDF4)
      },
      {
        'title': 'Physics Quiz Contest',
        'subtitle': 'Class 11 & 12 Complete Book',
        'image': 'asset/images/examCategoryIcon/cbse 12.png',
        'color': Color(0xffF3E8FF),
        'Time': '1 day ago',
        'conatinerColor': Color(0xffFAF5FF)
      }
    ];
    return Scaffold(
      backgroundColor: AppConstant.appBackGround,
      appBar: CustomAppBar(
        title: 'Notification',
        showBackButton: true,
        onAction2: () {
          Get.toNamed(RouteName.search);
        },
        showAvatar: false,
        searchIcon: 'asset/images/searchImage.png',
      ),
      body: Column(children: [
        Expanded(
          child: ListView.builder(
              itemCount: notifiocationList.length,
              itemBuilder: (BuildContext context, int index) {
                var item = notifiocationList[index];
                return Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  child: notificationAlert(
                      item['title'],
                      item['subtitle'],
                      item['image'],
                      item['color'],
                      item['Time'],
                      item['conatinerColor']),
                );
              }),
        )
      ]),
    );
  }
}

Widget notificationAlert(String title, String subtitle, String image,
    Color color, String time, Color container) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
    decoration: BoxDecoration(
        color: container, borderRadius: BorderRadius.all(Radius.circular(8.r))),
    child: Row(
      children: [
        ClipRRect(
          borderRadius:
              BorderRadius.circular(100.r), // Large value for circular shape
          child: Container(
            decoration: BoxDecoration(
              color: color,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 16.h),
              child: Image.asset(
                image,
                fit: BoxFit.contain,
                height: 14.h,
                width: 13.w,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 12.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: CustomTextStyle.bodyNormal
                    .copyWith(color: Colors.black, fontWeight: FontWeight.w500),
              ),
              Text(
                subtitle,
                style: CustomTextStyle.bodyNormal
                    .copyWith(color: Color(0xff4B5563)),
              ),
              Text(
                time,
                style:
                    CustomTextStyle.caption.copyWith(color: Color(0xff6B7280)),
              )
            ],
          ),
        )
      ],
    ),
  );
}
