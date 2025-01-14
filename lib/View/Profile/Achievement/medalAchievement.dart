import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:study_hub/Constants/constant.dart';
import 'package:study_hub/Widget/appBar.dart';

class Medalachievement extends StatefulWidget {
  const Medalachievement({super.key});

  @override
  State<Medalachievement> createState() => _MedalachievementState();
}

class _MedalachievementState extends State<Medalachievement> {
  late String filter;

  @override
  void initState() {
    super.initState();
    filter = Get.arguments?['filter'] ??
        'Gold'; // Default to Gold if no argument is passed
  }

  List<Map<String, dynamic>> achievement = [
    {
      'Achievement': 'Gold Medal',
      'Date': '2022-01-01',
      'Details': 'Achieved in the first quarter of the year',
      'Icon': 'asset/images/Gold (2).png'
    },
    {
      'Achievement': 'Silver Medal',
      'Date': '2021-12-15',
      'Details': 'Achieved in the last quarter of the year',
      'Icon': 'asset/images/Silver (2).png'
    },
    {
      'Achievement': 'Bronze Medal',
      'Date': '2021-11-10',
      'Details': 'Achieved in the middle of the year',
      'Icon': 'asset/images/Bronze (2).png'
    }
  ];
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredAchievement = achievement
        .where((item) => item['Achievement'].contains(filter))
        .toList();
    return Scaffold(
      backgroundColor: AppConstant.appBackGround,
      appBar: const CustomAppBar(
        title: 'Medal Achievements',
        showAvatar: true,
        notificationIcon: 'asset/images/notificationIcon.png',
        searchIcon: 'asset/images/searchImage.png',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 16.h),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: filteredAchievement.length,
                  itemBuilder: (BuildContext context, int index) {
                    var achieve = filteredAchievement[index];
                    return Padding(
                      padding: EdgeInsets.only(top: 16.h),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 4.w),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.r))),
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(achieve['Details']),
                          subtitle: Text(achieve['Achievement']),
                          trailing: Image.asset(
                            achieve['Icon'],
                            height: 32.h,
                            width: 24.w,
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
