import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:study_hub/Constants/constant.dart';
import 'package:study_hub/Route/RouteName.dart';
import 'package:study_hub/Service/dialog_helper.dart';
import 'package:study_hub/View/NcertBooks/Controller/ncertBooksController.dart';
import 'package:study_hub/View/NcertBooks/Model/ncertBookResponse.dart';
import 'package:study_hub/Widget/TextStyle.dart';
import 'package:study_hub/Widget/appBar.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Ncertbooks extends StatefulWidget {
  const Ncertbooks({super.key});

  @override
  State<Ncertbooks> createState() => _NcertbooksState();
}

class _NcertbooksState extends State<Ncertbooks> {
  Ncertbookscontroller ncertbookscontroller = Get.put(Ncertbookscontroller());
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    // Fetch categories initially
    ncertbookscontroller.getCategory().then((_) {
      // Ensure categories are fetched before fetching books
      if (ncertbookscontroller.category.isNotEmpty) {
        ncertbookscontroller.getBookList(
          Id: ncertbookscontroller.category.first!.id
              .toString(), // Fetch for the first category
        );
      }
    });

    // Add listener for infinite scrolling
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge &&
          _scrollController.position.pixels != 0) {
        print("At the bottom of the list.");
        if (!ncertbookscontroller.isLoadMore.value &&
            ncertbookscontroller.currentPage.value <
                ncertbookscontroller.totalPages.value) {
          print("Loading more books...");
          ncertbookscontroller.getBookList(
            // Id: ncertbookscontroller.category.first!.id.toString(),
            Id: ncertbookscontroller
                .category[ncertbookscontroller.selectedTab.value]!.id
                .toString(),
          );
        } else {
          print("No more pages to load or already loading.");
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // List<Map<String, dynamic>> notes = [
    //   {
    //     'class': 'Class 10',
    //     'nIcon': 'asset/images/notes1.png',
    //     'subjects': [
    //       {
    //         'subject': 'Mathematics',
    //         'color': const Color(0xffF3E8FF),
    //         'Books': [
    //           {
    //             'Book Name': 'Math Book',
    //             'Book Size': 'PDF 15 MB',
    //           },
    //           {
    //             'Book Name': 'Ncert Examplar',
    //             'Book Size': 'PDF 15 MB',
    //           },
    //         ]
    //       }
    //     ]
    //   },
    //   {
    //     'class': 'Class 11',
    //     'nIcon': 'asset/images/notes2.png',
    //     'subjects': [
    //       {
    //         'subject': 'Mathematics',
    //         'color': const Color(0xffF3E8FF),
    //         'Books': [
    //           {
    //             'Book Name': 'Math Book',
    //             'Book Size': 'PDF 15 MB',
    //           },
    //           {
    //             'Book Name': 'Ncert Examplar',
    //             'Book Size': 'PDF 15 MB',
    //           },
    //         ]
    //       }
    //     ]
    //   },
    //   {
    //     'class': 'Class 12',
    //     'nIcon': 'asset/images/notes3.png',
    //     'subjects': [
    //       {
    //         'subject': 'Mathematics',
    //         'color': const Color(0xffF3E8FF),
    //         'Books': [
    //           {
    //             'Book Name': 'Math Book',
    //             'Book Size': 'PDF 15 MB',
    //           },
    //           {
    //             'Book Name': 'Ncert Examplar',
    //             'Book Size': 'PDF 15 MB',
    //           },
    //         ]
    //       }
    //     ]
    //   },
    //   {
    //     'class': 'JEE',
    //     'nIcon': 'asset/images/notes1.png',
    //     'subjects': [
    //       {
    //         'subject': 'Math',
    //         'color': const Color(0xffF3E8FF),
    //         'Books': [
    //           {
    //             'Book Name': 'Science Book',
    //             'Book Size': 'PDF 15 MB',
    //           },
    //           {
    //             'Book Name': 'Ncert Examplar',
    //             'Book Size': 'PDF 15 MB',
    //           },
    //         ]
    //       }
    //     ]
    //   },
    //   {
    //     'class': 'NEET',
    //     'nIcon': 'asset/images/notes2.png',
    //     'subjects': [
    //       {
    //         'subject': 'Math',
    //         'color': const Color(0xffF3E8FF),
    //         'Books': [
    //           {
    //             'Book Name': 'Science Book',
    //             'Book Size': 'PDF 15 MB',
    //           },
    //           {
    //             'Book Name': 'Ncert Examplar',
    //             'Book Size': 'PDF 15 MB',
    //           },
    //         ]
    //       }
    //     ]
    //   }
    // ];

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
          Obx(() {
            if (ncertbookscontroller.isLoading.value) {
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
                        ncertbookscontroller.category.length,
                        (index) {
                          var isSelected =
                              ncertbookscontroller.selectedTab.value == index;
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: tabs(
                              ncertbookscontroller.category[index]!.name!,
                              isSelected,
                              // () => ncertbookscontroller.selectTab(index),
                              () {
                                ncertbookscontroller.selectTab(index);
                                ncertbookscontroller.getBookList(
                                  Id: ncertbookscontroller.category[index]!.id
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

          // List of Subjects
          // Obx(() {
          //   var selectedClass =
          //       notes[ncertbookscontroller.selectedTab.value]['class'];
          //   var subjects = notes.firstWhere(
          //       (note) => note['class'] == selectedClass)['subjects'];
          //   return SliverList(
          //     delegate: SliverChildBuilderDelegate(
          //       (context, index) {
          //         var subject = subjects[index];
          //         return subjectContainer(
          //             notes[index]['nIcon'] ??
          //                 'default_image.png', // Default fallback image
          //             subject['subject'] ??
          //                 'No Title', // Default fallback title
          //             '${subject['Books'].length}',
          //             subject['Books'],
          //             subject['color'] // Default chapter name if null
          //             );
          //       },
          //       childCount: subjects.length,
          //     ),
          //   );
          // }),
          Obx(() {
            if (ncertbookscontroller.bookData.value == null) {
              return SliverToBoxAdapter(
                  child: Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: shimmerSubjectContainer(),
              ));
            }

            var bookData = ncertbookscontroller.bookData.value!;
            var subjects = bookData.data; // Map API response to `subjects`.

            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  var subject = subjects[index];
                  return subjectContainer(
                    subject.icon ?? '', // Dynamic icon URL
                    subject.subjectName ?? 'No Title', // Subject name
                    '${subject.books!.length}', // Total chapters/books
                    subject.books!, // List of books
                    Color(int.parse('0xFF${subject.color}')), // Parse hex color
                  );
                },
                childCount: subjects!.length,
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
    List<Book> books, Color color) {
  ScrollController _scrollController = ScrollController();
  // Future<void> downloadFile(String url, String fileName) async {
  //   try {
  //     final permissionStatus = await Permission.storage.request();
  //     if (permissionStatus.isGranted) {
  //       // Define the local path for saving the file
  //       final directory = await getApplicationDocumentsDirectory();
  //       final filePath = '${directory.path}/$fileName';

  //       // Download the file
  //       final dio = Dio();
  //       await dio.download(url, filePath);

  //       // Notify the user
  //       Get.snackbar(
  //         'Download Complete',
  //         'File saved to $filePath',
  //         snackPosition: SnackPosition.BOTTOM,
  //       );
  //     } else {
  //       Get.snackbar(
  //         'Permission Denied',
  //         'Storage permission is required to download the file.',
  //         snackPosition: SnackPosition.BOTTOM,
  //       );
  //     }
  //   } catch (e) {
  //     Get.snackbar(
  //       'Error',
  //       'Failed to download file: $e',
  //       snackPosition: SnackPosition.BOTTOM,
  //     );
  //   }
  // }
  Future<void> downloadFile(String url, String fileName) async {
    try {
      // Request storage permission
      final permissionStatus = await Permission.storage.request();
      if (permissionStatus.isGranted) {
        // Get the public Downloads directory
        final downloadsDir = Directory('/storage/emulated/0/Download');
        if (!await downloadsDir.exists()) {
          await downloadsDir.create(recursive: true);
        }

        final filePath = '${downloadsDir.path}/$fileName';

        // Download the file
        final dio = Dio();
        await dio.download(url, filePath);

        // Notify the user
        Get.snackbar(
          'Download Complete',
          'File saved to $filePath',
          snackPosition: SnackPosition.BOTTOM,
        );

        print('File saved to: $filePath'); // Log file path
      } else if (permissionStatus.isPermanentlyDenied) {
        // Open app settings if permission is permanently denied
        await openAppSettings();
      } else {
        Get.snackbar(
          'Permission Denied',
          'Storage permission is required to download the file.',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      // Handle errors
      Get.snackbar(
        'Error',
        'Failed to download file: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
      print('Error downloading file: $e');
    }
  }

  void viewPdf(String url) {
    Get.to(() => Scaffold(
          appBar: AppBar(title: Text('View PDF')),
          body: SfPdfViewer.network(url),
        ));
  }

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
                child: Image.network(
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
                      var chapter = books[index];
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
                                      chapter.title!,
                                      style: CustomTextStyle.bodyNormal
                                          .copyWith(
                                              color: Color(0xff000000),
                                              fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      '${chapter.fileSize} MB',
                                      style: CustomTextStyle.bodyNormal
                                          .copyWith(
                                              color: Color(0xff4B5563),
                                              fontWeight: FontWeight.w400),
                                    )
                                  ],
                                )),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () => viewPdf(chapter.fileUrl!),
                                      child: Image.asset(
                                        'asset/images/seeNotes.png',
                                        height: 14.h,
                                        width: 14.w,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    GestureDetector(
                                      onTap: () => downloadFile(
                                          chapter.fileUrl!,
                                          '${chapter.title}.pdf'),
                                      child: Image.asset(
                                        'asset/images/saveNotes.png',
                                        height: 14.h,
                                        width: 14.w,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            )),
                      );
                    },
                    childCount: books.length,
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
