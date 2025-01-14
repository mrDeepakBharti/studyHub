import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:study_hub/Constants/constant.dart';
import 'package:study_hub/Route/RouteName.dart';
import 'package:study_hub/View/NcertBooks/Controller/ncertBooksController.dart';
import 'package:study_hub/Widget/TextStyle.dart';
import 'package:study_hub/Widget/appBar.dart';

class Ncertbooks extends StatelessWidget {
  const Ncertbooks({super.key});

  @override
  Widget build(BuildContext context) {
    Ncertbookscontroller ncertbookscontroller = Get.put(Ncertbookscontroller());

    List<Map<String, dynamic>> notes = [
      {
        'class': 'Class 10',
        'nIcon': 'asset/images/notes1.png',
        'subjects': [
          {
            'subject': 'Mathematics',
            'color': const Color(0xffF3E8FF),
            'Books': [
              {
                'Book Name': 'Math Book',
                'Book Size': 'PDF 15 MB',
              },
              {
                'Book Name': 'Ncert Examplar',
                'Book Size': 'PDF 15 MB',
              },
            ]
          }
        ]
      },
      {
        'class': 'Class 11',
        'nIcon': 'asset/images/notes2.png',
        'subjects': [
          {
            'subject': 'Mathematics',
            'color': const Color(0xffF3E8FF),
            'Books': [
              {
                'Book Name': 'Math Book',
                'Book Size': 'PDF 15 MB',
              },
              {
                'Book Name': 'Ncert Examplar',
                'Book Size': 'PDF 15 MB',
              },
            ]
          }
        ]
      },
      {
        'class': 'Class 12',
        'nIcon': 'asset/images/notes3.png',
        'subjects': [
          {
            'subject': 'Mathematics',
            'color': const Color(0xffF3E8FF),
            'Books': [
              {
                'Book Name': 'Math Book',
                'Book Size': 'PDF 15 MB',
              },
              {
                'Book Name': 'Ncert Examplar',
                'Book Size': 'PDF 15 MB',
              },
            ]
          }
        ]
      },
      {
        'class': 'JEE',
        'nIcon': 'asset/images/notes1.png',
        'subjects': [
          {
            'subject': 'Math',
            'color': const Color(0xffF3E8FF),
            'Books': [
              {
                'Book Name': 'Science Book',
                'Book Size': 'PDF 15 MB',
              },
              {
                'Book Name': 'Ncert Examplar',
                'Book Size': 'PDF 15 MB',
              },
            ]
          }
        ]
      },
      {
        'class': 'NEET',
        'nIcon': 'asset/images/notes2.png',
        'subjects': [
          {
            'subject': 'Math',
            'color': const Color(0xffF3E8FF),
            'Books': [
              {
                'Book Name': 'Science Book',
                'Book Size': 'PDF 15 MB',
              },
              {
                'Book Name': 'Ncert Examplar',
                'Book Size': 'PDF 15 MB',
              },
            ]
          }
        ]
      }
    ];

    return Scaffold(
      backgroundColor: AppConstant.appBackGround,
      appBar: CustomAppBar(
        title: 'NCERT Books',
        onAction2: () {
          Get.toNamed(RouteName.search);
        },
        onAction1: () {
          Get.toNamed(RouteName.notifications);
        },
        showAvatar: true,
        notificationIcon: 'asset/images/notificationIcon.png',
        searchIcon: 'asset/images/searchImage.png',
      ),
      body: CustomScrollView(
        slivers: [
          // Header Text
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Text(
                'Access your Ncert Books For Self Study',
                style: CustomTextStyle.bodyNormal.copyWith(
                    fontWeight: FontWeight.w400, color: Color(0xff6B7280)),
              ),
            ),
          ),

          // Tabs Row
          Obx(() => SliverToBoxAdapter(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Row(
                      children: List.generate(
                        notes.length,
                        (index) {
                          var isSelected =
                              ncertbookscontroller.selectedTab.value == index;
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: tabs(
                              notes[index]['class']!,
                              isSelected,
                              () => ncertbookscontroller.selectTab(index),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              )),

          // List of Subjects
          Obx(() {
            var selectedClass =
                notes[ncertbookscontroller.selectedTab.value]['class'];
            var subjects = notes.firstWhere(
                (note) => note['class'] == selectedClass)['subjects'];
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  var subject = subjects[index];
                  return subjectContainer(
                      notes[index]['nIcon'] ??
                          'default_image.png', // Default fallback image
                      subject['subject'] ??
                          'No Title', // Default fallback title
                      '${subject['Books'].length}',
                      subject['Books'],
                      subject['color'] // Default chapter name if null
                      );
                },
                childCount: subjects.length,
              ),
            );
          }),
        ],
      ),
    );
  }
}

// Tab Widget
Widget tabs(String title, bool isSelected, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 15.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8.r)),
        color: isSelected ? AppConstant.buttonColor : Color(0xffF3F4F6),
      ),
      child: Text(
        title,
        style: CustomTextStyle.bodyNormal.copyWith(
          color: isSelected ? Colors.white : Color(0xff4B5563),
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
        ),
      ),
    ),
  );
}

Widget subjectContainer(String image, String title, String totalChapter,
    List<dynamic> chName, Color color) {
  ScrollController _scrollController = ScrollController();
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
    child: Card(
      elevation: 0.5,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 17.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          border: Border.all(color: Color(0xffE5E7EB)),
        ),
        child: Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Container(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
                decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.all(Radius.circular(8.r))),
                child: Image.asset(
                  image,
                  height: 28.h,
                  width: 15.w,
                ),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: CustomTextStyle.bodyNormal.copyWith(
                        color: Color(0xff111827), fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Color(0xff9CA3AF),
              ),
            ),

            // Using SliverList inside CustomScrollView
            SizedBox(height: 16.h),
            CustomScrollView(
              controller: _scrollController,
              shrinkWrap: true,
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      var chapter = chName[index];
                      return Padding(
                        padding: EdgeInsets.only(bottom: 12.h),
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.w, vertical: 12.h),
                            decoration: BoxDecoration(
                              color: Color(0xffE5E7EB).withOpacity(0.12),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.r)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset('asset/images/ncertBookIcon.png',
                                    height: 14.h,
                                    width: 13.w,
                                    fit: BoxFit.contain),
                                SizedBox(
                                  width: 15.w,
                                ),
                                Expanded(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      chapter['Book Name'],
                                      style: CustomTextStyle.bodyNormal
                                          .copyWith(
                                              color: Color(0xff000000),
                                              fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      chapter['Book Size'],
                                      style: CustomTextStyle.bodyNormal
                                          .copyWith(
                                              color: Color(0xff4B5563),
                                              fontWeight: FontWeight.w400),
                                    )
                                  ],
                                )),
                                Row(
                                  children: [
                                    Image.asset(
                                      'asset/images/seeNotes.png',
                                      height: 14.h,
                                      width: 14.w,
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Image.asset(
                                      'asset/images/saveNotes.png',
                                      height: 14.h,
                                      width: 14.w,
                                    )
                                  ],
                                )
                              ],
                            )),
                      );
                    },
                    childCount: chName.length,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
