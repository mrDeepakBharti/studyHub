import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';
import 'package:study_hub/Constants/constant.dart';
import 'package:study_hub/Route/RouteName.dart';
import 'package:study_hub/View/practice.dart';
import 'package:study_hub/Widget/CustomButton.dart';
import 'package:study_hub/Widget/TextStyle.dart';
import 'package:study_hub/Widget/appBar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> tabList = [
      {'image': 'asset/images/studyTabImage/Ncert.png', 'title': 'Ncert'},
      {'image': 'asset/images/studyTabImage/Notes.png', 'title': 'Notes'},
      {'image': 'asset/images/studyTabImage/papers.png', 'title': 'Papers'},
      {'image': 'asset/images/studyTabImage/Contest.png', 'title': 'Contest'},
      {'image': 'asset/images/studyTabImage/Tricks.png', 'title': 'Tricks'},
      {'image': 'asset/images/studyTabImage/help.png', 'title': 'Help'}
    ];

    List<Map<String, dynamic>> recentActivity = [
      {
        'title': 'Physics Chapter 5 Quiz',
        'subTitle': 'Score: 92/100',
        'Time': '2h ago'
      },
      {
        'title': 'Chemistry Notes Downloaded',
        'subTitle': 'Organic Chemistry Unit 3',
        'Time': '5h ago'
      },
      {
        'title': 'Bio Tricks Downloaded',
        'subTitle': 'Animal Kingdom Tricks',
        'Time': '6h ago'
      },
    ];

    List<Map<String, dynamic>> recommendedBook = [
      {
        'image': 'asset/images/recommendedBook/Biology.png',
        'title': 'Biology Fundamentals',
        'subTitle': 'Class 12 BioLogy Book',
      },
      {
        'image': 'asset/images/recommendedBook/Math.png',
        'title': 'Advanced Mathematics',
        'subTitle': 'Class 12 Math Book',
      },
      {
        'image': 'asset/images/recommendedBook/Chemistery.png',
        'title': 'Chemistery Fundamentals',
        'subTitle': 'Class 12 Chemistery Book',
      },
      {
        'image': 'asset/images/recommendedBook/Physic.png',
        'title': 'Physic Fundamentals',
        'subTitle': 'Class 12 Physic Book',
      },
      {
        'image': 'asset/images/recommendedBook/Java.png',
        'title': 'Java Coding',
        'subTitle': 'Black Book Editions',
      },
      {
        'image': 'asset/images/recommendedBook/Python.png',
        'title': 'Python Fundamentals',
        'subTitle': 'Python Book Editions',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: CustomScrollView(
        slivers: [
          // Custom Sliver AppBar
          SliverAppBar(
            // expandedHeight: 200.h, // Adjust height as needed
            // floating: false,
            pinned: true,
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              background: CustomAppBar(
                title: 'Dashboard',
                onAction2: () {
                  // Get.toNamed(RouteName.search);
                  Get.to(()=>Practice());
                },
                onAction1: () {
                  Get.toNamed(RouteName.notifications);
                },
                showAvatar: true,
                notificationIcon: 'asset/images/notificationIcon.png',
                searchIcon: 'asset/images/searchImage.png',
              ),
            ),
          ),

          // List of horizontal tabs
          SliverToBoxAdapter(
            child: SizedBox(
              height: 100.h,
              child: ListView.builder(
                itemCount: tabList.length,
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 16.h),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 13.w),
                    child: studyTab(
                        tabList[index]['image'], tabList[index]['title'], () {
                      switch (index) {
                        case 0:
                          Get.toNamed(RouteName.ncertBook);
                          break;
                        case 1:
                          Get.toNamed(RouteName.notes);
                          break;
                        case 2:
                          Get.toNamed(RouteName.previousYear);
                          break;
                        case 3:
                          Get.toNamed(RouteName.weeklyContests);
                          break;
                        case 4:
                          Get.toNamed(RouteName.tricks);
                          break;
                        case 5:
                          Get.toNamed(RouteName.helpScreen);
                          break;
                      }
                    }),
                  );
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 10.h,
            ),
          ),
          // Carousel Section
          SliverToBoxAdapter(
            child: SizedBox(
              height: 190.h,
              child: GFCarousel(
                autoPlayAnimationDuration: Duration(seconds: 3),
                items: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 4.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.r)),
                      color: Color(0xff6f43be),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 16.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'National Science Olympiad',
                            style: CustomTextStyle.bodyNormal.copyWith(
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                fontSize: 18.sp),
                          ),
                          Text(
                            "Register now for the biggest science competition of the year",
                            style: CustomTextStyle.bodyNormal
                                .copyWith(color: Colors.white),
                          ),
                          SizedBox(height: 16.h),
                          Padding(
                            padding: EdgeInsets.only(right: 170.w),
                            child: customButton(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8.h, horizontal: 25.w),
                              backgroundColor: Colors.white,
                              title: 'Register Now',
                              onPressed: () {},
                              style: CustomTextStyle.bodyNormal.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 13.sp,
                                color: AppConstant.buttonColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
                hasPagination: true,
                activeIndicator: Colors.white,
                passiveIndicator: Colors.grey.withOpacity(0.5),
                viewportFraction: 0.9,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                height: 220.h,
                enlargeMainPage: true,
              ),
            ),
          ),

          // Recent Activities Section
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Text(
                'Recent Activities',
                style: CustomTextStyle.bodyNormal.copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  child: ActivityContainer(
                    recentActivity[index]['title'],
                    recentActivity[index]['subTitle'],
                    recentActivity[index]['Time'],
                  ),
                );
              },
              childCount: recentActivity.length,
            ),
          ),

          // Recommended for You Section
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Text(
                'Recommended for You',
                style: CustomTextStyle.bodyNormal.copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 230.h,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: recommendedBook.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 16.w),
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12, vertical: 12.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 128.h,
                              width: 140.w,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      recommendedBook[index]['image']),
                                  fit: BoxFit.contain,
                                ),
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  recommendedBook[index]['title'],
                                  style: CustomTextStyle.bodyNormal.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                  ),
                                ),
                                Text(
                                  recommendedBook[index]['subTitle'],
                                  style: CustomTextStyle.bodyNormal.copyWith(
                                      color: Color(0xff6B7280),
                                      fontSize: 12.sp),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 28.h,
            ),
          )
        ],
      ),
    );
  }
}

Widget studyTab(String image, String title, VoidCallback onTap,
    {double imageHeight = 10, double imageWidth = 14}) {
  return GestureDetector(
    onTap: onTap,
    child: Column(
      children: [
        Container(
          height: 56.h,
          width: 56.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.r)),
              color: AppConstant.buttonColor.withOpacity(0.10)),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: imageWidth, vertical: imageHeight),
            child: Image(
              image: AssetImage(image),
              fit: BoxFit.contain,
              height: imageHeight.h,
              width: imageWidth.w,
            ),
          ),
        ),
        Text(
          title,
          style: CustomTextStyle.caption.copyWith(color: Colors.black),
        )
      ],
    ),
  );
}

Widget ActivityContainer(String title, String subtitle, String time) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8.r))),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: CustomTextStyle.bodyNormal
                  .copyWith(fontWeight: FontWeight.w500, color: Colors.black),
            ),
            Text(subtitle,
                style: CustomTextStyle.bodyNormal
                    .copyWith(color: Color(0xff6B7280)))
          ],
        ),
        Text(
          time,
          style: CustomTextStyle.bodyNormal
              .copyWith(color: AppConstant.buttonColor),
        )
      ],
    ),
  );
}




    /*Scaffold(
      backgroundColor: Colors.transparent,
      appBar: const CustomAppBar(
        showAvatar: true,
        notificationIcon: 'asset/images/notificationIcon.png',
        searchIcon: 'asset/images/searchImage.png',
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 100.h,
            child: ListView.builder(
              itemCount: tabList.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 16.h),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 13.w),
                  child: studyTab(
                      tabList[index]['image'], tabList[index]['title'], () {
                    switch (index) {
                      case 0:
                        Get.toNamed(RouteName.bottomNav);
                        break;
                      case 1:
                        Get.toNamed(RouteName.bottomNav);
                        break;
                      case 2:
                        Get.toNamed(RouteName.bottomNav);
                        break;
                      case 3:
                        Get.toNamed(RouteName.bottomNav);
                        break;
                      case 4:
                        Get.toNamed(RouteName.bottomNav);
                        break;
                      case 5:
                        Get.toNamed(RouteName.bottomNav);
                        break;
                      case 6:
                        Get.toNamed(RouteName.bottomNav);
                        break;
                    }
                  }),
                );
              },
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          SizedBox(
            height: 180.h,
            child: GFCarousel(
              items: [
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: 4.w), // Reduced margin to avoid overflow
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8.r)),
                    color: Color(0xff6f43be),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'National Science Olympiad',
                          style: CustomTextStyle.bodyNormal.copyWith(
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              fontSize: 18.sp),
                        ),
                        Text(
                          "Register now for the biggest science competition of the year",
                          style: CustomTextStyle.bodyNormal
                              .copyWith(color: Colors.white),
                        ),
                        SizedBox(height: 16.h),
                        Padding(
                          padding: EdgeInsets.only(right: 150.w),
                          child: customButton(
                            padding: EdgeInsets.symmetric(
                                vertical: 8.h, horizontal: 15.w),
                            backgroundColor: Colors.white,
                            title: 'Register Now',
                            onPressed: () {},
                            style: CustomTextStyle.bodyNormal.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 13.sp,
                              color: AppConstant.buttonColor,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
              hasPagination: true,
              activeIndicator: Colors.white,
              passiveIndicator: Colors.grey.withOpacity(0.5),
              viewportFraction: 0.8, // Keep this for scaling and centering
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              height: 250.h,
              enlargeMainPage: true,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Text(
              'Recent Activities',
              style: CustomTextStyle.bodyNormal.copyWith(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: recentActivity.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: ActivityContainer(
                      recentActivity[index]['title'],
                      recentActivity[index]['subTitle'],
                      recentActivity[index]['Time']),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 16.h,
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Text(
              'Recommended for You',
              style: CustomTextStyle.bodyNormal.copyWith(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
          ),
          SizedBox(
            height: 216.h,
            child: GFCarousel(
              items: List.generate(recommendedBook.length, (index) {
                return Padding(
                  padding: EdgeInsets.only(
                      left: 12.w, right: 12.w, top: 12.w, bottom: 8.w),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(recommendedBook[index]['image']),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 16.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            recommendedBook[index]['title'],
                            style: CustomTextStyle.bodyNormal.copyWith(
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              fontSize: 18.sp,
                            ),
                          ),
                          Text(
                            recommendedBook[index]['subTitle'],
                            style: CustomTextStyle.bodyNormal.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
              hasPagination: true,
              activeIndicator: Colors.white,
              passiveIndicator: Colors.grey.withOpacity(0.5),
              viewportFraction: 0.8, // Keep this for scaling and centering
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              height: 250.h,
              enlargeMainPage: true,
            ),
          )
        ],
      ),
    );*/