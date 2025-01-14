import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:study_hub/Constants/constant.dart';
import 'package:study_hub/View/WeeklyContests/Controller/weeklyController.dart';
import 'package:study_hub/Widget/CustomButton.dart';
import 'package:study_hub/Widget/TextStyle.dart';
import 'package:study_hub/Widget/appBar.dart';
import 'package:study_hub/Widget/customTextFeild.dart';

class WeeklyContests extends StatelessWidget {
  const WeeklyContests({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> contests = [
      {
        'contextTime': 'Morning Contest',
        'time': '10:00 AM - 11:00 AM',
        'color': const Color(0xffDBEAFE),
        'IconColor': const Color(0xff2563EB),
        'Running': 'Live',
        'subject': 'Biology Section',
        'details': '50 Questions • 60 Minutes'
      },
      {
        'contextTime': 'Evening Contest',
        'time': '6:00 PM - 7:00 PM',
        'color': const Color(0xffF3E8FF),
        'IconColor': const Color(0xff9333EA),
        'Running': 'UpComing',
        'subject': 'Chemistry Section',
        'details': '45 Questions • 60 Minutes'
      },
    ];

    List<Map<String, dynamic>> winnerList = [
      {
        'Performers': 'Top Performers',
        'winnerList': [
          {
            'name': 'Rahul Kumar',
            'profile': 'asset/images/profile.png',
            'Rank': '1',
            'score': '980',
            'percentage': '98%'
          },
          {
            'name': 'Priya Singh',
            'profile': 'asset/images/profile.png',
            'Rank': '2',
            'score': '945',
            'percentage': '94.5%'
          },
          {
            'name': 'Amit Patel',
            'profile': 'asset/images/profile.png',
            'Rank': '3',
            'score': '920',
            'percentage': '92%'
          }
        ]
      }
    ];
    return Scaffold(
      backgroundColor: AppConstant.appBackGround,
      appBar: const CustomAppBar(
        title: 'Weekly Contests',
        showAvatar: true,
        notificationIcon: 'asset/images/notificationIcon.png',
        searchIcon: 'asset/images/searchImage.png',
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 16.h,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                'Participate in NEET & JEE practice contests',
                style: CustomTextStyle.bodyNormal
                    .copyWith(color: const Color(0xff6B7280)),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  var contest = contests[index];
                  return Container(
                      margin: EdgeInsets.only(bottom: 16.h),
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 16.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(8.r)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 14.w, vertical: 10.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                color: contest['color'],
                              ),
                              child: Icon(
                                CupertinoIcons.time_solid,
                                color: contest['IconColor'],
                              ),
                            ),
                            title: Text(
                              contest['contextTime'],
                              style: CustomTextStyle.bodyNormal.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                            subtitle: Text(contest['time']),
                            trailing: contest['Running'] == 'Live'
                                ? Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 4.h, horizontal: 12.w),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.r)),
                                        color: Color(0xffDCFCE7)),
                                    child: Text(
                                      contest['Running'],
                                      style: CustomTextStyle.bodyNormal
                                          .copyWith(color: Color(0xff16A34A)),
                                    ),
                                  )
                                : Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 4.h, horizontal: 12.w),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.r)),
                                        color: Color(0xffF3F4F6)),
                                    child: Text(
                                      contest['Running'],
                                      style: CustomTextStyle.caption
                                          .copyWith(color: Color(0xff4B5563)),
                                    ),
                                  ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.w, vertical: 12.h),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.r)),
                                color: const Color(0xffF9FAFB)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      contest['subject'],
                                      style: CustomTextStyle.bodyNormal
                                          .copyWith(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600),
                                    ),
                                    Text(contest['details'])
                                  ],
                                ),
                                contest['Running'] == 'Live'
                                    ? customButton(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15.w, vertical: 8.h),
                                        backgroundColor:
                                            AppConstant.buttonColor,
                                        title: 'Join Now',
                                        onPressed: () {
                                          showJoinContestDialog(context);
                                        },
                                        style: CustomTextStyle.bodyNormal
                                            .copyWith(color: Colors.white))
                                    : customButton(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16.w, vertical: 8.h),
                                        backgroundColor:
                                            const Color(0xffE5E7EB),
                                        title: 'Remind me',
                                        onPressed: () {},
                                        style: CustomTextStyle.bodyNormal
                                            .copyWith(
                                                color: const Color(0xff4B5563)))
                              ],
                            ),
                          )
                        ],
                      ));
                },
                childCount: contests.length,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8.r)),
                    color: const Color(0xff6a41b8)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Weekly Leaderboard',
                          style: CustomTextStyle.bodyNormal.copyWith(
                              fontWeight: FontWeight.w600, color: Colors.white),
                        ),
                        Text(
                          'Top 100 performers',
                          style: CustomTextStyle.bodyNormal
                              .copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.emoji_events,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  var winnerData = winnerList[index];
                  List<dynamic> winner = winnerData['winnerList'];

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
                          winnerData['Performers'],
                          style: CustomTextStyle.BodyBold.copyWith(
                            color: Color(0xff111827),
                          ),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: winner.length,
                          itemBuilder: (context, winnerIndex) {
                            var currentWinner = winner[winnerIndex];
                            List<Color> rankColors = [
                              Color(0xFFFACC15), // Yellow (1st)
                              Color(0xFFD1D5DB), // Gray (2nd)
                              Color(0xFFFB923C), // Orange (3rd)
                            ];
                            return ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundImage:
                                        AssetImage(currentWinner['profile']),
                                  ),
                                  Positioned(
                                    top: -4,
                                    right: -4,
                                    child: Container(
                                      padding: EdgeInsets.all(6),
                                      decoration: BoxDecoration(
                                        color: rankColors[
                                            winnerIndex % rankColors.length],
                                        shape: BoxShape.circle,
                                      ),
                                      child: Text(
                                        currentWinner['Rank'],
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              title: Text(
                                currentWinner['name'],
                                style: CustomTextStyle.bodyNormal.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              subtitle: Text(
                                'Score: ${currentWinner['score']} | Rank: ${currentWinner['Rank']}',
                              ),
                              trailing: Text(
                                currentWinner['percentage'],
                                style: CustomTextStyle.bodyNormal.copyWith(
                                  color: AppConstant.buttonColor,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
                childCount: winnerList.length,
              ),
            ),
          )
        ],
      ),
    );
  }
}

void showJoinContestDialog(BuildContext context) {
  Weeklycontroller weeklycontroller = Get.put(Weeklycontroller());
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Join Contest',
              style: CustomTextStyle.bodyNormal.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Color(0xff3D3D3D),
                  fontSize: 18.sp),
            ),
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Icon(Icons.close),
            )
          ],
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Full Name',
              style: CustomTextStyle.BodyBold.copyWith(
                color: const Color(0xff374151),
                fontSize: 14.sp,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            CustomTextInputField(
                textInputAction: TextInputAction.next,
                hintText: 'Enter Name',
                controller: weeklycontroller.fullName,
                obscureText: false,
                mandatoryField: true),
            SizedBox(
              height: 16.h,
            ),
            Text(
              'Email',
              style: CustomTextStyle.BodyBold.copyWith(
                color: const Color(0xff374151),
                fontSize: 14.sp,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            CustomTextInputField(
                textInputAction: TextInputAction.next,
                hintText: 'Enter Email',
                controller: weeklycontroller.email,
                obscureText: false,
                mandatoryField: true),
            SizedBox(
              height: 16.h,
            ),
            Text(
              'Phone Number',
              style: CustomTextStyle.BodyBold.copyWith(
                color: const Color(0xff374151),
                fontSize: 14.sp,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            CustomTextInputField(
                textInputAction: TextInputAction.next,
                hintText: 'Enter Phone Number',
                controller: weeklycontroller.phoneNumber,
                obscureText: false,
                mandatoryField: true),
            SizedBox(
              height: 16.h,
            ),
            Text(
              'Education',
              style: CustomTextStyle.BodyBold.copyWith(
                color: const Color(0xff374151),
                fontSize: 14.sp,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            CustomTextInputField(
                textInputAction: TextInputAction.next,
                hintText: 'Enter Education',
                controller: weeklycontroller.school,
                obscureText: false,
                mandatoryField: true),
            SizedBox(
              height: 16.h,
            ),
            customButton(
                backgroundColor: AppConstant.buttonColor,
                padding: EdgeInsets.symmetric(horizontal: 80.w, vertical: 8.h),
                title: 'Join Now',
                onPressed: () {},
                style: CustomTextStyle.bodyNormal.copyWith(color: Colors.white))
          ],
        ),
      );
    },
  );
}
