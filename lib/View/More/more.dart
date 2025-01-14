import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:study_hub/Route/RouteName.dart';
import 'package:study_hub/Widget/TextStyle.dart';
import 'package:study_hub/Widget/appBar.dart';
import 'package:study_hub/utils/sharedPreference/localDatabase.dart';

class More extends StatelessWidget {
  const More({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> iconList = [
      {
        'title': 'Notification',
        'icon1': Icons.notifications,
        'icon2': Icons.arrow_forward_ios
      },
      {
        'title': 'Appearance',
        'icon1': Icons.color_lens_sharp,
        'icon2': Icons.arrow_forward_ios
      },
      {
        'title': 'Help Center',
        'icon1': Icons.help,
        'icon2': Icons.arrow_forward_ios
      },
      {
        'title': 'Contact Support',
        'icon1': Icons.contact_emergency,
        'icon2': Icons.arrow_forward_ios
      },
      {
        'title': 'Terms of Service',
        'icon1': Icons.file_copy,
        'icon2': Icons.arrow_forward_ios
      },
      {
        'title': 'Privacy Policy',
        'icon1': Icons.privacy_tip,
        'icon2': Icons.arrow_forward_ios
      }
    ];
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Settings',
        showAvatar: false,
        showBackButton: true,
      ),
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: iconList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        switch (index) {
                          case 0:
                            Get.toNamed(RouteName.notifications);
                            break;
                          case 1:
                            // Get.toNamed(RouteName.notes);
                            break;
                          case 2:
                            Get.toNamed(RouteName.helpScreen);
                            break;
                          case 3:
                            // Get.toNamed(RouteName.weeklyContests);
                            break;
                          case 4:
                            // Get.toNamed(RouteName.tricks);
                            break;
                          case 5:
                            // Get.toNamed(RouteName.helpScreen);
                            break;
                        }
                      },
                      child: listTile(iconList[index]['icon1'],
                          iconList[index]['title'], iconList[index]['icon2']),
                    );
                  }),
            ),
            GestureDetector(
              onTap: () {
                Get.offAllNamed(RouteName.login);
                UserSimplePreferences.clearProfileToken();
              },
              child: Container(
                padding:
                    EdgeInsets.symmetric(horizontal: 120.w, vertical: 10.h),
                color: Colors.white,
                child: Row(
                  children: [
                    Icon(
                      Icons.logout,
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      'Sig Out',
                      style: CustomTextStyle.bodyNormal.copyWith(
                          color: Colors.red,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget listTile(IconData icon, String title, IconData icon2) {
  return ListTile(
    leading: Icon(
      icon,
      size: 20,
      color: Color(0xff4B5563),
    ),
    title: Text(title,
        style: CustomTextStyle.bodyNormal.copyWith(
            fontSize: 17.sp, color: Colors.black, fontWeight: FontWeight.w500)),
    trailing: Icon(
      icon2,
      size: 20,
      color: Colors.black,
    ),
  );
}
