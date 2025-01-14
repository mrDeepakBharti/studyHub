import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_hub/Constants/constant.dart';
import 'package:study_hub/Widget/TextStyle.dart';
import 'package:study_hub/Widget/appBar.dart';

class Tricks extends StatelessWidget {
  const Tricks({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> subject = [
      {
        'subjects': 'Physic',
        'sIcon': 'asset/images/physic (2).png',
        'color': Color(0xffDBEAFE),
        'data': [
          {'count': '100+ Tricks'}
        ]
      },
      {
        'subjects': 'Chemistry',
        'color': Color(0xffDCFCE7),
        'sIcon': 'asset/images/notes2.png',
        'data': [
          {'count': '80+ Tricks'}
        ]
      },
      {
        'subjects': 'Biology',
        'sIcon': 'asset/images/bio (2).png',
        'color': Color(0xffFEE2E2),
        'data': [
          {'count': '90+ Tricks'}
        ]
      },
      {
        'subjects': 'Mathematics',
        'color': Color(0xffF3E8FF),
        'sIcon': 'asset/images/cals.png',
        'data': [
          {'count': '120+ Tricks'}
        ]
      }
    ];
    List<Map<String, dynamic>> recent = [
      {
        'subjects': 'Physic',
        'sIcon': 'asset/images/physic (2).png',
        'read': 'Physics Quick Formula',
        'activity': 'Remember complex physics formulas easily',
        'color': Color(0xffDBEAFE),
        'textColor': Color(0xff2563EB),
        'class': 'class 11',
        'time': '5 min read'
      },
      {
        'subjects': 'Chemistry',
        'sIcon': 'asset/images/physic (2).png',
        'read': 'Chemistry Reactions',
        'activity': 'Master organic chemistry reactions',
        'textColor': Color(0xff16A34A),
        'color': Color(0xffDCFCE7),
        'class': 'Class 12',
        'time': '8 min read'
      },
      {
        'subjects': 'Biology',
        'sIcon': 'asset/images/physic (2).png',
        'read': 'Biology Diagrams',
        'activity': 'Easy way to remember diagrams',
        'textColor': Color(0xffDC2626),
        'color': Color(0xffFEE2E2),
        'class': 'Class 10',
        'time': '6 min read'
      },
    ];
    return Scaffold(
      backgroundColor: AppConstant.appBackGround,
      appBar: const CustomAppBar(
        title: 'Learning Tricks',
        showAvatar: true,
        notificationIcon: 'asset/images/notificationIcon.png',
        searchIcon: 'asset/images/searchImage.png',
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 24.h),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  var subjects = subject[index];
                  var dataList = subjects['data'];

                  return Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(8.r)),
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(80.r)),
                          child: Container(
                            color: subjects['color'],
                            padding: EdgeInsets.symmetric(
                                vertical: 10.h, horizontal: 14.w),
                            child: Image.asset(
                              subjects['sIcon'],
                              height: 28.h,
                              width: 20.w,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          subjects['subjects'],
                          style: CustomTextStyle.BodyBold.copyWith(
                              color: Colors.black),
                        ),
                        SizedBox(height: 10.h),
                        ...dataList
                            .map<Widget>(
                              (data) => Text(
                                data['count'],
                                style: CustomTextStyle.bodyNormal,
                              ),
                            )
                            .toList(),
                      ],
                    ),
                  );
                },
                childCount: subject.length,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.9,
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  var recentActivity = recent[index];
                  return Container(
                    margin: EdgeInsets.only(bottom: 16.h),
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(8.r)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          recentActivity['read'],
                          style: CustomTextStyle.bodyNormal.copyWith(
                            color: recentActivity['textColor'],
                          ),
                        ),
                        Text(
                          recentActivity['activity'],
                          style: CustomTextStyle.bodyNormal.copyWith(
                            color: const Color(0xff4B5563),
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: recentActivity['color'],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6.r)),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.w, vertical: 4.h),
                              child: Text(
                                recentActivity['class'],
                                style: CustomTextStyle.bodyNormal.copyWith(
                                  color: recentActivity['textColor'],
                                ),
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              recentActivity['time'],
                              style: CustomTextStyle.caption
                                  .copyWith(color: const Color(0xff6B7280)),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
                childCount: recent.length,
              ),
            ),
          )
        ],
      ),
    );

    // body: Column(
    //   children: [
    //     Expanded(
    //       child: Padding(
    //         padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 24.h),
    //         child: GridView.builder(
    //             itemCount: subject.length,
    //             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //                 childAspectRatio: 0.9,
    //                 mainAxisSpacing: 16,
    //                 crossAxisSpacing: 16,
    //                 crossAxisCount: 2),
    //             itemBuilder: (BuildContext context, int index) {
    //               var subjects = subject[index];
    //               var dataList =
    //                   subjects['data']; // Get the full list of data

    //               return Container(
    //                 padding: EdgeInsets.symmetric(
    //                     horizontal: 16.w, vertical: 16.h),
    //                 decoration: BoxDecoration(
    //                     color: Colors.white,
    //                     borderRadius: BorderRadius.all(Radius.circular(8.r))),
    //                 child: Column(
    //                   children: [
    //                     ClipRRect(
    //                       borderRadius:
    //                           BorderRadius.all(Radius.circular(80.r)),
    //                       child: Container(
    //                         color: subjects['color'],
    //                         padding: EdgeInsets.symmetric(
    //                             vertical: 10.h, horizontal: 14.w),
    //                         child: Image.asset(
    //                           subjects['sIcon'],
    //                           height: 28.h,
    //                           width: 20.w,
    //                         ),
    //                       ),
    //                     ),
    //                     SizedBox(
    //                       height: 10.h,
    //                     ),
    //                     Text(
    //                       subjects['subjects'],
    //                       style: CustomTextStyle.BodyBold.copyWith(
    //                           color: Colors.black),
    //                     ),
    //                     SizedBox(
    //                       height: 10.h,
    //                     ),
    //                     ...dataList
    //                         .map<Widget>((data) => Text(
    //                               data['count'],
    //                               style: CustomTextStyle.bodyNormal,
    //                             ))
    //                         .toList(),
    //                   ],
    //                 ),
    //               );
    //             }),
    //       ),
    //     ),
    //     Expanded(
    //       child: Padding(
    //         padding: EdgeInsets.symmetric(horizontal: 30.w),
    //         child: ListView.separated(
    //           itemCount: recent.length,
    //           itemBuilder: (BuildContext context, int index) {
    //             var recentActivity = recent[index];
    //             return Container(
    //               padding:
    //                   EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
    //               decoration: BoxDecoration(
    //                   color: Colors.white,
    //                   borderRadius: BorderRadius.all(Radius.circular(8.r))),
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Text(
    //                     recentActivity['read'],
    //                     style: CustomTextStyle.bodyNormal.copyWith(
    //                       color: recentActivity['textColor'],
    //                     ),
    //                   ),
    //                   Text(
    //                     recentActivity['activity'],
    //                     style: CustomTextStyle.bodyNormal.copyWith(
    //                       color: Color(0xff4B5563),
    //                     ),
    //                   ),
    //                   SizedBox(
    //                     height: 8.h,
    //                   ),
    //                   Row(
    //                     children: [
    //                       Container(
    //                         decoration: BoxDecoration(
    //                             color: recentActivity['color'],
    //                             borderRadius:
    //                                 BorderRadius.all(Radius.circular(6.r))),
    //                         padding: EdgeInsets.symmetric(
    //                             horizontal: 8.w, vertical: 4.h),
    //                         child: Text(
    //                           recentActivity['class'],
    //                           style: CustomTextStyle.bodyNormal.copyWith(
    //                               color: recentActivity['textColor']),
    //                         ),
    //                       ),
    //                       SizedBox(
    //                         width: 8.w,
    //                       ),
    //                       Text(
    //                         recentActivity['time'],
    //                         style: CustomTextStyle.caption
    //                             .copyWith(color: Color(0xff6B7280)),
    //                       )
    //                     ],
    //                   )
    //                 ],
    //               ),
    //             );
    //           },
    //           separatorBuilder: (BuildContext context, int index) {
    //             return SizedBox(
    //               height: 10.h,
    //             );
    //           },
    //         ),
    //       ),
    //     )
    //   ],
    // ),
  }
}
