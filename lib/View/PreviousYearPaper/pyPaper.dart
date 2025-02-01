import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:study_hub/Constants/constant.dart';
import 'package:study_hub/Route/RouteName.dart';
import 'package:study_hub/Service/dialog_helper.dart';
import 'package:study_hub/View/PreviousYearPaper/Models/paperResponse.dart';
import 'package:study_hub/View/PreviousYearPaper/PYPaperController/PYPaperController.dart';
import 'package:study_hub/Widget/TextStyle.dart';
import 'package:study_hub/Widget/appBar.dart';
import 'package:study_hub/utils/sharedPreference/localDatabase.dart';

class PYPaper extends StatefulWidget {
  const PYPaper({super.key});

  @override
  State<PYPaper> createState() => _PYPaperState();
}

class _PYPaperState extends State<PYPaper> {
  final Pypapercontroller tabController = Get.put(Pypapercontroller());
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Fetch categories initially
    tabController.getCategory().then((_) {
      // Ensure categories are fetched before fetching books
      if (tabController.category.isNotEmpty) {
        tabController
            .getSubjectCategory(id: tabController.category.first!.id.toString())
            .then((value) {
          tabController.getPreviousPaper(
              categoryId: tabController
                  .category[tabController.selectedTab.value]!.id
                  .toString(),
              subjectId: tabController.subjectCategory.first!.id.toString());
        });
        kLogger.f('Category Id:${tabController.category.first!.id.toString()}');
        kLogger.f(
            'Subject Id:${tabController.subjectCategory.first!.id.toString()}');

        // kLogger.e(tabController.paperData.toJson());
      }
      kLogger.t(tabController.subjectCategory.toList());
    });

    // Add listener for infinite scrolling
    _scrollController.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> notes = [
      {
        'class': 'Class 10',
        'subjects': [
          {
            'subject': 'Mathematics',
            'color': Color(0xffF3E8FF),
            'nIcon': 'asset/images/notes1.png',
            'previousYearPapers': [
              {
                'year': 2024,
                'sets': ['Set A', 'Set B', 'Set C', 'Set D']
              },
              {
                'year': 2023,
                'sets': ['Set A', 'Set B', 'Set C', 'Set D']
              },
              {
                'year': 2022,
                'sets': ['Set A', 'Set B', 'Set C', 'Set D']
              }
            ]
          },
          {
            'subject': 'Science',
            'color': Color(0xffE0F7FA),
            'nIcon': 'asset/images/notes2.png',
            'previousYearPapers': [
              {
                'year': 2024,
                'sets': ['Set A', 'Set B', 'Set C', 'Set D']
              },
              // {
              //   'year': 2023,
              //   'sets': ['Set A', 'Set B', 'Set C', 'Set D']
              // },
              // {
              //   'year': 2022,
              //   'sets': ['Set A', 'Set B', 'Set C', 'Set D']
              // }
            ]
          },
          {
            'subject': 'Social Studies',
            'color': Color(0xffF8BBD0),
            'nIcon': 'asset/images/notes3.png',
            'previousYearPapers': [
              {
                'year': 2024,
                'sets': ['Set A', 'Set B', 'Set C', 'Set D']
              },
              {
                'year': 2023,
                'sets': ['Set A', 'Set B', 'Set C', 'Set D']
              },
              // {
              //   'year': 2022,
              //   'sets': ['Set A', 'Set B', 'Set C', 'Set D']
              // }
            ]
          }
        ]
      },
      {
        'class': 'Class 11',
        'subjects': [
          {
            'subject': 'Physics',
            'color': Color(0xffF3E8FF),
            'nIcon': 'asset/images/notes1.png',
            'previousYearPapers': [
              {
                'year': 2024,
                'sets': ['Set A', 'Set B', 'Set C', 'Set D']
              },
              {
                'year': 2023,
                'sets': ['Set A', 'Set B', 'Set C', 'Set D']
              },
              {
                'year': 2022,
                'sets': ['Set A', 'Set B', 'Set C', 'Set D']
              }
            ]
          },
          {
            'subject': 'Chemistry',
            'color': Color(0xffFDCFCE7),
            'nIcon': 'asset/images/notes2.png',
            'previousYearPapers': [
              {
                'year': 2024,
                'sets': ['Set A', 'Set B', 'Set C', 'Set D']
              },
              {
                'year': 2023,
                'sets': ['Set A', 'Set B', 'Set C', 'Set D']
              },
              {
                'year': 2022,
                'sets': ['Set A', 'Set B', 'Set C', 'Set D']
              }
            ]
          },
          {
            'subject': 'Mathematics',
            'color': Color(0xffFFF59D),
            'nIcon': 'asset/images/notes3.png',
            'previousYearPapers': [
              {
                'year': 2024,
                'sets': ['Set A', 'Set B', 'Set C', 'Set D']
              },
              {
                'year': 2023,
                'sets': ['Set A', 'Set B', 'Set C', 'Set D']
              },
              {
                'year': 2022,
                'sets': ['Set A', 'Set B', 'Set C', 'Set D']
              }
            ]
          }
        ]
      },
      {
        'class': 'Class 12',
        'subjects': [
          {
            'subject': 'Biology',
            'color': Color(0xffF3E8FF),
            'nIcon': 'asset/images/notes1.png',
            'previousYearPapers': [
              {
                'year': 2024,
                'sets': ['Set A', 'Set B', 'Set C', 'Set D']
              },
              {
                'year': 2023,
                'sets': ['Set A', 'Set B', 'Set C', 'Set D']
              },
              {
                'year': 2022,
                'sets': ['Set A', 'Set B', 'Set C', 'Set D']
              }
            ]
          },
          {
            'subject': 'Chemistry',
            'color': Color(0xffFDCFCE7),
            'nIcon': 'asset/images/notes2.png',
            'previousYearPapers': [
              {
                'year': 2024,
                'sets': ['Set A', 'Set B', 'Set C', 'Set D']
              },
              {
                'year': 2023,
                'sets': ['Set A', 'Set B', 'Set C', 'Set D']
              },
              {
                'year': 2022,
                'sets': ['Set A', 'Set B', 'Set C', 'Set D']
              }
            ]
          },
          {
            'subject': 'Physics',
            'color': Color(0xffFFF59D),
            'nIcon': 'asset/images/notes3.png',
            'previousYearPapers': [
              {
                'year': 2024,
                'sets': ['Set A', 'Set B', 'Set C', 'Set D']
              },
              {
                'year': 2023,
                'sets': ['Set A', 'Set B', 'Set C', 'Set D']
              },
              {
                'year': 2022,
                'sets': ['Set A', 'Set B', 'Set C', 'Set D']
              }
            ]
          }
        ]
      },
      {
        'class': 'JEE',
        'subjects': [
          {
            'subject': 'Mathematics',
            'color': Color(0xffF3E8FF),
            'nIcon': 'asset/images/notes1.png',
            'previousYearPapers': [
              {
                'year': 2024,
                'sets': ['Set A', 'Set B', 'Set C', 'Set D']
              },
              {
                'year': 2023,
                'sets': ['Set A', 'Set B', 'Set C', 'Set D']
              },
              {
                'year': 2022,
                'sets': ['Set A', 'Set B', 'Set C', 'Set D']
              }
            ]
          },
          {
            'subject': 'Physics',
            'color': Color(0xffFDCFCE7),
            'nIcon': 'asset/images/notes2.png',
            'previousYearPapers': [
              {
                'year': 2024,
                'sets': ['Set A', 'Set B', 'Set C', 'Set D']
              },
              {
                'year': 2023,
                'sets': ['Set A', 'Set B', 'Set C', 'Set D']
              },
              {
                'year': 2022,
                'sets': ['Set A', 'Set B', 'Set C', 'Set D']
              }
            ]
          },
          {
            'subject': 'Chemistry',
            'color': Color(0xffFFF59D),
            'nIcon': 'asset/images/notes3.png',
            'previousYearPapers': [
              {
                'year': 2024,
                'sets': ['Set A', 'Set B', 'Set C', 'Set D']
              },
              {
                'year': 2023,
                'sets': ['Set A', 'Set B', 'Set C', 'Set D']
              },
              {
                'year': 2022,
                'sets': ['Set A', 'Set B', 'Set C', 'Set D']
              }
            ]
          }
        ]
      },
      {
        'class': 'NEET',
        'subjects': [
          {
            'subject': 'Biology',
            'color': Color(0xffF3E8FF),
            'nIcon': 'asset/images/notes1.png',
            'previousYearPapers': [
              {
                'year': 2024,
                'sets': ['Set A', 'Set B', 'Set C', 'Set D']
              },
              {
                'year': 2023,
                'sets': ['Set A', 'Set B', 'Set C', 'Set D']
              },
              {
                'year': 2022,
                'sets': ['Set A', 'Set B', 'Set C', 'Set D']
              }
            ]
          },
          {
            'subject': 'Physics',
            'color': Color(0xffFDCFCE7),
            'nIcon': 'asset/images/notes2.png',
            'previousYearPapers': [
              {
                'year': 2024,
                'sets': ['Set A', 'Set B', 'Set C', 'Set D']
              },
              {
                'year': 2023,
                'sets': ['Set A', 'Set B', 'Set C', 'Set D']
              },
              {
                'year': 2022,
                'sets': ['Set A', 'Set B', 'Set C', 'Set D']
              }
            ]
          },
          {
            'subject': 'Chemistry',
            'color': Color(0xffFFF59D),
            'nIcon': 'asset/images/notes3.png',
            'previousYearPapers': [
              {
                'year': 2024,
                'sets': ['Set A', 'Set B', 'Set C', 'Set D']
              },
              {
                'year': 2023,
                'sets': ['Set A', 'Set B', 'Set C', 'Set D']
              },
              {
                'year': 2022,
                'sets': ['Set A', 'Set B', 'Set C', 'Set D']
              }
            ]
          }
        ]
      },
      {
        'class': 'BSc Nursing',
        'subjects': [
          {
            'subject': 'Anatomy',
            'color': Color(0xffF3E8FF),
            'nIcon': 'asset/images/notes1.png',
            'previousYearPapers': [
              {
                'year': 2024,
                'sets': ['Set A', 'Set B', 'Set C', 'Set D']
              },
              {
                'year': 2023,
                'sets': ['Set A', 'Set B', 'Set C', 'Set D']
              },
              {
                'year': 2022,
                'sets': ['Set A', 'Set B', 'Set C', 'Set D']
              }
            ]
          },
          {
            'subject': 'Physiology',
            'color': Color(0xffFDCFCE7),
            'nIcon': 'asset/images/notes2.png',
            'previousYearPapers': [
              {
                'year': 2024,
                'sets': ['Set A', 'Set B', 'Set C', 'Set D']
              },
              {
                'year': 2023,
                'sets': ['Set A', 'Set B', 'Set C', 'Set D']
              },
              {
                'year': 2022,
                'sets': ['Set A', 'Set B', 'Set C', 'Set D']
              }
            ]
          },
          {
            'subject': 'Nursing Foundation',
            'color': Color(0xffFFF59D),
            'nIcon': 'asset/images/notes3.png',
            'previousYearPapers': [
              {
                'year': 2024,
                'sets': ['Set A', 'Set B', 'Set C', 'Set D']
              },
              {
                'year': 2023,
                'sets': ['Set A', 'Set B', 'Set C', 'Set D']
              },
              {
                'year': 2022,
                'sets': ['Set A', 'Set B', 'Set C', 'Set D']
              }
            ]
          }
        ]
      }
    ];

    // Initialize the controller to handle tab selection

    return Scaffold(
      backgroundColor: AppConstant.appBackGround,
      appBar: CustomAppBar(
        title: 'Previous Year Papers',
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
                'Access question papers by exam & year',
                style: CustomTextStyle.bodyNormal.copyWith(
                    fontWeight: FontWeight.w400, color: Color(0xff6B7280)),
              ),
            ),
          ),

          // Tabs Row
          Obx(() {
            if (tabController.isLoading.value) {
              return SliverToBoxAdapter(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Row(
                      children: List.generate(
                        5, // Number of shimmer placeholders
                        (index) => shimmerTab(), // Use the shimmerTab function
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return SliverToBoxAdapter(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Row(
                      children: List.generate(
                        tabController.category.length,
                        (index) {
                          var isSelected =
                              tabController.selectedTab.value == index;
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: tabs(
                              tabController.category[index]!.name!,
                              isSelected,
                              // () => ncertbookscontroller.selectTab(index),
                              () {
                                tabController.selectTab(index);
                                tabController.getSubjectCategory(
                                  id: tabController.category[index]!.id
                                      .toString(),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              );
            }
          }),
          Obx(() {
            if (tabController.isLoading.value) {
              return SliverToBoxAdapter(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Row(
                      children: List.generate(
                        5, // Number of shimmer placeholders
                        (index) => shimmerTab(), // Use the shimmerTab function
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return SliverToBoxAdapter(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h),
                    child: Row(
                      children: List.generate(
                        // notes[tabController.selectedTab.value]['subjects']
                        //     .length,
                        // Fix here
                        tabController.subjectCategory.length,
                        (index) {
                          var isSelected =
                              tabController.selectedSubject.value == index;
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: subjectTabs(
                              // notes[tabController.selectedTab.value]['subjects']
                              //     [index]['subject'],
                              tabController.subjectCategory[index]!.name!,
                              isSelected,
                              () {
                                tabController.selectSub(index);
                                tabController.getPreviousPaper(
                                  categoryId: tabController
                                      .category[
                                          tabController.selectedTab.value]!
                                      .id
                                      .toString(),
                                  subjectId: tabController
                                      .subjectCategory[index]!.id
                                      .toString(),
                                );
                                kLogger.f(
                                    'Category Id:${tabController.category[tabController.selectedTab.value]!.id.toString()}');
                                kLogger.f(
                                    'Subject Id:${tabController.subjectCategory[index]!.id.toString()}');
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              );
            }
          }),

          // Obx(() {
          //   var selectedClass = notes[tabController.selectedTab.value]['class'];
          //   var subjects = notes.firstWhere(
          //       (note) => note['class'] == selectedClass)['subjects'];

          //   // Get the selected subject
          //   var selectedSubject = subjects[tabController.selectedSubject.value];

          //   return SliverList(
          //     delegate: SliverChildBuilderDelegate(
          //       (context, index) {
          //         var subject = subjects[index];

          //         // Only show the previous year papers for the selected subject
          //         if (subject['subject'] == selectedSubject['subject']) {
          //           return subjectContainer(
          //               subject['previousYearPapers'], subject['nIcon']);
          //         } else {
          //           // If it's not the selected subject, do not display the previous year papers
          //           return Container(); // Empty container for other subjects
          //         }
          //       },
          //       childCount: subjects.length,
          //     ),
          //   );
          // }),

          Obx(() {
            if (tabController.isLoading.value) {
              return SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(top: 20.h),
                  child: shimmerSubjectContainer(),
                ),
              );
            } else {
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    var paper = tabController.paperData[index];

                    // Only show the previous year papers for the selected subject

                    return subjectContainer(paper!.papers!);
                  },
                  childCount: tabController.paperData.length,
                ),
              );
            }
          })
        ],
      ),
    );
  }
}

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

Widget subjectTabs(String title, bool isSelected, VoidCallback onTap) {
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

// Widget subjectContainer(List<dynamic> previousYears, String image) {
Widget subjectContainer(List<Paper> previousYears) {
  ScrollController _scrollController = ScrollController();
  List<Color> myColors = [
    Color(0xffDBEAFE), // Light Blue
    Color(0xffDCFCE7), // Slightly Darker Blue
    Color(0xffF3E8FF), // Medium Blue
  ];

  Color getColorForIndex(int index) {
    int colorIndex = (index ~/ 2) % myColors.length;
    return myColors[colorIndex];
  }

  return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
      child: ListView.separated(
        controller: _scrollController,
        shrinkWrap: true,
        itemCount: previousYears.length,
        itemBuilder: (context, index) {
          var yearData = previousYears[index];
          var sets = yearData.paperSet; // The available sets for that year
          Color containerColor = myColors[index % myColors.length];
          var countLength = sets!.length;
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 17.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(8.r)),
              border: Border.all(color: Color(0xffE5E7EB)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 13.h),
                    decoration: BoxDecoration(
                        color: containerColor,
                        borderRadius: BorderRadius.all(Radius.circular(8.r))),
                    child: Image.asset(
                      'asset/images/notes1.png',
                      height: 20.h,
                      width: 15.w,
                      fit: BoxFit.contain,
                    ),
                  ),
                  title: Text(
                    '${yearData.paperSet}',
                    style: CustomTextStyle.bodyNormal.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    '${countLength.toString()} Sets Available',
                    style: CustomTextStyle.caption
                        .copyWith(color: Color(0xff6B7280)),
                  ),
                  // subtitle: Text(data),
                ),
                SizedBox(height: 8.h),
                ListView.builder(
                    controller: _scrollController,
                    shrinkWrap: true,
                    itemCount: sets.length,
                    itemBuilder: (BuildContext context, int index) {
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
                                Expanded(
                                  child: RichText(
                                      overflow: TextOverflow.ellipsis,
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text: 'Set${sets[index]}',
                                            style: CustomTextStyle.bodyNormal
                                                .copyWith(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                            )),
                                        // TextSpan(
                                        //     text: ' ${chapter['title']}',
                                        //     style: CustomTextStyle.bodyNormal
                                        //         .copyWith(
                                        //       color: Colors.black,
                                        //       fontWeight: FontWeight.w600,
                                        //     ))
                                      ])),
                                ),
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
                    })
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(height: 16.h);
        },
      ));
}
