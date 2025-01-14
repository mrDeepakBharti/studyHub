import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:study_hub/Constants/constant.dart';
import 'package:study_hub/View/BottomNavBar/bottomNavBarController/controller.dart';
import 'package:study_hub/View/Home/home.dart';
import 'package:study_hub/View/More/more.dart';
import 'package:study_hub/View/Profile/profile.dart';
import 'package:study_hub/View/Quiz/quiz.dart';

class Bottomnavbar extends StatefulWidget {
  const Bottomnavbar({super.key});

  @override
  State<Bottomnavbar> createState() => _BottomnavbarState();
}

class _BottomnavbarState extends State<Bottomnavbar> {
  BottomNavBarController controller = Get.put(BottomNavBarController());
  final scaffoldKey = GlobalKey<ScaffoldState>();

  List<Widget> Screen = const [Home(), Quiz(), Profile(), More()];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppConstant.appBackGround),
      child: SafeArea(
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.transparent,
          body: Obx(() => Screen[controller.currentIndex.value]),
          bottomNavigationBar: Obx(() {
            return BottomNavigationBar(
                backgroundColor: Colors.white,
                elevation: 2,
                currentIndex: controller.currentIndex.value,
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: true,
                showUnselectedLabels: true,
                enableFeedback: true,
                onTap: (index) {
                  controller.currentIndex.value = index;
                },
                items: [
                  bottomNavigationItem(Icons.home, 'Home', 0),
                  bottomNavigationItem(Icons.emoji_events, 'Quiz', 1),
                  bottomNavigationItem(Icons.person, 'Profile', 2),
                  bottomNavigationItem(Icons.more_horiz, 'More', 3),
                ]);
          }),
        ),
      ),
    );
  }

  BottomNavigationBarItem bottomNavigationItem(
      IconData icon, String lable, int index) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        size: controller.currentIndex.value == index ? 28.sp : 24.sp,
        color: controller.currentIndex.value == index
            ? AppConstant.buttonColor
            : Color(0xff6B7280),
      ),
      label: lable,
    );
  }
}
