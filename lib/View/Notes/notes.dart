import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:study_hub/Constants/constant.dart';
import 'package:study_hub/Route/RouteName.dart';
import 'package:study_hub/Service/dialog_helper.dart';
import 'package:study_hub/View/Notes/notesController/notesController.dart';
import 'package:study_hub/Widget/TextStyle.dart';
import 'package:study_hub/Widget/appBar.dart';

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  Notescontroller notescontroller = Get.put(Notescontroller());
  @override
  void initState() {
    notescontroller.getCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> notes = [
      {
        'class': 'Class 10',
        'nIcon': 'asset/images/notes1.png',
        'subjects': [
          {
            'subject': 'Mathematics',
            'color': Color(0xffF3E8FF),
            'notes': [
              {
                'chapter': 1,
                'title': 'Real Numbers',
                'content':
                    'Understanding Euclid\'s Division Lemma, Fundamental Theorem of Arithmetic, and properties of real numbers.'
              },
              {
                'chapter': 2,
                'title': 'Polynomials',
                'content':
                    'Exploring polynomial identities, zeroes of polynomials, and factorization methods.'
              },
              {
                'chapter': 3,
                'title': 'Pair of Linear Equations in Two Variables',
                'content':
                    'Graphical and algebraic solutions of linear equations.'
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
            'subject': 'Physics',
            'color': Color(0xffF3E8FF),
            'notes': [
              {
                'chapter': 1,
                'title': 'Physical World',
                'content': 'Understanding the scope and excitement of physics.'
              },
              {
                'chapter': 2,
                'title': 'Units and Measurements',
                'content': 'Measurement of physical quantities and errors.'
              },
              {
                'chapter': 1,
                'title': 'Physical World',
                'content': 'Understanding the scope and excitement of physics.'
              },
              {
                'chapter': 2,
                'title': 'Units and Measurements',
                'content': 'Measurement of physical quantities and errors.'
              },
              {
                'chapter': 1,
                'title': 'Physical World',
                'content': 'Understanding the scope and excitement of physics.'
              },
              {
                'chapter': 2,
                'title': 'Units and Measurements',
                'content': 'Measurement of physical quantities and errors.'
              },
              {
                'chapter': 1,
                'title': 'Physical World',
                'content': 'Understanding the scope and excitement of physics.'
              },
              {
                'chapter': 2,
                'title': 'Units and Measurements',
                'content': 'Measurement of physical quantities and errors.'
              },
              {
                'chapter': 1,
                'title': 'Physical World',
                'content': 'Understanding the scope and excitement of physics.'
              },
              {
                'chapter': 2,
                'title': 'Units and Measurements',
                'content': 'Measurement of physical quantities and errors.'
              },
              {
                'chapter': 1,
                'title': 'Physical World',
                'content': 'Understanding the scope and excitement of physics.'
              },
              {
                'chapter': 2,
                'title': 'Units and Measurements',
                'content': 'Measurement of physical quantities and errors.'
              }
            ]
          },
          {
            'subject': 'Mathematics',
            'color': Color(0xffFDCFCE7),
            'notes': [
              {
                'chapter': 1,
                'title': 'Sets',
                'content': 'Understanding sets and their representations.'
              },
              {
                'chapter': 2,
                'title': 'Relations and Functions',
                'content': 'Exploring relations and functions in detail.'
              },
              {
                'chapter': 1,
                'title': 'Sets',
                'content': 'Understanding sets and their representations.'
              },
              {
                'chapter': 2,
                'title': 'Relations and Functions',
                'content': 'Exploring relations and functions in detail.'
              },
              {
                'chapter': 1,
                'title': 'Sets',
                'content': 'Understanding sets and their representations.'
              },
              {
                'chapter': 2,
                'title': 'Relations and Functions',
                'content': 'Exploring relations and functions in detail.'
              },
              {
                'chapter': 1,
                'title': 'Sets',
                'content': 'Understanding sets and their representations.'
              },
              {
                'chapter': 2,
                'title': 'Relations and Functions',
                'content': 'Exploring relations and functions in detail.'
              },
              {
                'chapter': 1,
                'title': 'Sets',
                'content': 'Understanding sets and their representations.'
              },
              {
                'chapter': 2,
                'title': 'Relations and Functions',
                'content': 'Exploring relations and functions in detail.'
              },
              {
                'chapter': 1,
                'title': 'Sets',
                'content': 'Understanding sets and their representations.'
              },
              {
                'chapter': 2,
                'title': 'Relations and Functions',
                'content': 'Exploring relations and functions in detail.'
              }
            ]
          }
        ]
      },
      {
        'class': 'Class 12',
        'nIcon': 'asset/images/notes3.png',
        'subjects': [
          {
            'subject': 'Chemistry',
            'color': Color(0xffF3E8FF),
            'notes': [
              {
                'chapter': 1,
                'title': 'Solid State',
                'content':
                    'Classification of solids based on different binding forces.'
              },
              {
                'chapter': 2,
                'title': 'Solutions',
                'content': 'Study of solutions and their properties.'
              }
            ]
          },
          {
            'subject': 'Biology',
            'color': Color(0xffFDCFCE7),
            'notes': [
              {
                'chapter': 1,
                'title': 'Reproduction',
                'content': 'Reproductive processes in humans and plants.'
              },
              {
                'chapter': 2,
                'title': 'Genetics and Evolution',
                'content': 'Understanding the principles of inheritance.'
              }
            ]
          }
        ]
      },
      {
        'class': 'JEE',
        'nIcon': 'asset/images/notes1.png',
        'subjects': [
          {
            'subject': 'Mathematics',
            'color': Color(0xffF3E8FF),
            'notes': [
              {
                'chapter': 1,
                'title': 'Complex Numbers',
                'content':
                    'Understanding complex numbers and their applications.'
              },
              {
                'chapter': 2,
                'title': 'Matrices and Determinants',
                'content': 'Solving equations using matrices and determinants.'
              }
            ]
          },
          {
            'subject': 'Physics',
            'color': Color(0xffFDCFCE7),
            'notes': [
              {
                'chapter': 1,
                'title': 'Kinematics',
                'content': 'Study of motion in a straight line and in planes.'
              },
              {
                'chapter': 2,
                'title': 'Laws of Motion',
                'content': 'Newton’s laws and applications.'
              }
            ]
          }
        ]
      },
      {
        'class': 'NEET',
        'nIcon': 'asset/images/notes2.png',
        'subjects': [
          {
            'subject': 'Biology',
            'color': Color(0xffF3E8FF),
            'notes': [
              {
                'chapter': 1,
                'title': 'Human Physiology',
                'content': 'Detailed study of human body systems.'
              },
              {
                'chapter': 2,
                'title': 'Plant Physiology',
                'content': 'Understanding plant growth and development.'
              }
            ]
          },
          {
            'subject': 'Chemistry',
            'color': Color(0xffFDCFCE7),
            'notes': [
              {
                'chapter': 1,
                'title': 'Organic Chemistry',
                'content': 'Study of organic compounds and reactions.'
              },
              {
                'chapter': 2,
                'title': 'Inorganic Chemistry',
                'content': 'Understanding the periodic table and bonding.'
              }
            ]
          }
        ]
      }
    ];

    // return Scaffold(
    //   backgroundColor: AppConstant.appBackGround,
    //   appBar: CustomAppBar(
    //     title: 'Class Notes',
    //     onAction2: () {
    //       Get.toNamed(RouteName.search);
    //     },
    //     onAction1: () {
    //       Get.toNamed(RouteName.notifications);
    //     },
    //     showAvatar: true,
    //     notificationIcon: 'asset/images/notificationIcon.png',
    //     searchIcon: 'asset/images/searchImage.png',
    //   ),
    //   body: Column(
    //     children: [
    //       Padding(
    //         padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
    //         child: Text(
    //           'Access question papers by exam & year',
    //           style: CustomTextStyle.bodyNormal.copyWith(
    //               fontWeight: FontWeight.w400, color: Color(0xff6B7280)),
    //         ),
    //       ),
    //       Obx(() => SingleChildScrollView(
    //             scrollDirection: Axis.horizontal,
    //             child: Row(
    //               children: List.generate(
    //                 notes.length,
    //                 (index) {
    //                   var isSelected =
    //                       notescontroller.selectedTab.value == index;
    //                   return Padding(
    //                     padding: EdgeInsets.symmetric(horizontal: 8.w),
    //                     child: tabs(
    //                       notes[index]['class']!,
    //                       isSelected,
    //                       () => notescontroller.selectTab(index),
    //                     ),
    //                   );
    //                 },
    //               ),
    //             ),
    //           )),
    //       Obx(() {
    //         var selectedClass =
    //             notes[notescontroller.selectedTab.value]['class'];
    //         var subjects = notes.firstWhere(
    //             (note) => note['class'] == selectedClass)['subjects'];
    //         return Expanded(
    //           child: ListView.builder(
    //             itemCount: subjects.length,
    //             itemBuilder: (context, index) {
    //               var subject = subjects[index];
    //               return subjectContainer(
    //                 notes[index]['nIcon'] ??
    //                     'default_image.png', // Default fallback image
    //                 subject['subject'] ?? 'No Title', // Default fallback title
    //                 '${subject['notes'].length}',
    //                 subject['notes'], // Default chapter name if null
    //               );
    //             },
    //           ),
    //         );
    //       }),
    //     ],
    //   ),
    return Scaffold(
      backgroundColor: AppConstant.appBackGround,
      appBar: CustomAppBar(
        title: 'Class Notes',
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
            if (notescontroller.isLoading.value) {
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
                        notescontroller.category.length,
                        (index) {
                          var isSelected =
                              notescontroller.selectedTab.value == index;
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: tabs(
                              notescontroller.category[index]!.name!,
                              isSelected,
                              () => notescontroller.selectTab(index),
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

          // List of Subjects
          Obx(() {
            var selectedClass =
                notes[notescontroller.selectedTab.value]['class'];
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
                      '${subject['notes'].length}',
                      subject['notes'],
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
                  Text(
                    "$totalChapter chapters",
                    style: CustomTextStyle.caption.copyWith(
                        color: Color(0xff6B7280), fontWeight: FontWeight.w500),
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
                                Expanded(
                                  child: RichText(
                                      overflow: TextOverflow.ellipsis,
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text: '${chapter['chapter']}.',
                                            style: CustomTextStyle.bodyNormal
                                                .copyWith(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                            )),
                                        TextSpan(
                                            text: ' ${chapter['title']}',
                                            style: CustomTextStyle.bodyNormal
                                                .copyWith(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                            ))
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
