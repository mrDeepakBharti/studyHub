import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:study_hub/Constants/constant.dart';
import 'package:study_hub/View/SearchPage/searchController/searchController.dart';
import 'package:study_hub/Widget/TextStyle.dart';
import 'package:study_hub/Widget/customTextFeild.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> searchResult = [
      {
        'title': 'NCERT Physics Book',
        'subtitle': 'Class 11 & 12 Complete Book',
        'image': 'asset/images/examCategoryIcon/jee.png',
        'color': Color(0xffDBEAFE)
      },
      {
        'title': 'Physics Notes',
        'subtitle': 'Chapter-wise detailed notes',
        'image': 'asset/images/examCategoryIcon/bio.png',
        'color': Color(0xffDCFCE7)
      },
      {
        'title': 'Physics Quiz Contest',
        'subtitle': 'Class 11 & 12 Complete Book',
        'image': 'asset/images/examCategoryIcon/cbse 12.png',
        'color': Color(0xffF3E8FF)
      }
    ];

    Searchcontroller searchcontroller = Get.put(Searchcontroller());
    return Scaffold(
      backgroundColor: AppConstant.appBackGround,
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 80.h, // Adjust height as needed
            // floating: false,
            backgroundColor: Colors.transparent,
            pinned: true,
            automaticallyImplyLeading: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: EdgeInsets.only(top: 10.h, left: 50.w, right: 10.w),
                child: CustomTextInputField(
                  textInputAction: TextInputAction.done,
                  hintText: 'Search for books, notes, contests...',
                  controller: searchcontroller.search,
                  suffixIcon: Icon(Icons.search),
                  obscureText: false,
                  mandatoryField: true,
                  onChanged: (value) {
                    searchcontroller.filterResults(value, searchResult);
                  },
                ),
              ),
            ),
          ),
          // SliverToBoxAdapter(
          //   child: Padding(
          //     padding: EdgeInsets.symmetric(horizontal: 40.w),
          //     child: Text(
          //       'Search Results',
          //       style: CustomTextStyle.bodyNormal.copyWith(
          //           fontWeight: FontWeight.w700, color: Color(0xff374151)),
          //     ),
          //   ),
          // ),

          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
              child: Text(
                'Recent Searches',
                style: CustomTextStyle.bodyNormal.copyWith(
                    fontWeight: FontWeight.w700, color: Color(0xff374151)),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Obx(() => ListView.builder(
                  shrinkWrap: true,
                  itemCount: searchcontroller.recentSearches.length,
                  itemBuilder: (context, index) {
                    var item = searchcontroller.recentSearches[index];
                    return recentSearch(item['title'].toString());
                  },
                )),
          ),
          SliverToBoxAdapter(
              child: Obx(() => ListView.builder(
                    shrinkWrap: true,
                    itemCount: searchcontroller.filteredResults.length,
                    itemBuilder: (context, index) {
                      var item = searchcontroller.filteredResults[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 10.h),
                        child: SearchResult(item['title'], item['subtitle'],
                            item['image'], item['color']),
                      );
                    },
                  ))),
        ],
      )),
    );
  }
}

Widget SearchResult(String title, String subtitle, String image, Color color) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8.r))),
    child: Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: color,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 16.h),
            child: Image.asset(
              image,
              fit: BoxFit.contain,
              height: 14.h,
              width: 13.w,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 12.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: CustomTextStyle.bodyNormal
                    .copyWith(color: Colors.black, fontWeight: FontWeight.w500),
              ),
              Text(
                subtitle,
                style: CustomTextStyle.bodyNormal
                    .copyWith(color: Color(0xff4B5563)),
              )
            ],
          ),
        )
      ],
    ),
  );
}

Widget recentSearch(String title) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 15.w),
    child: ListTile(
      title: Text(
        title,
        style: CustomTextStyle.bodyNormal.copyWith(color: Color(0xff4B5563)),
      ),
      trailing: Icon(
        Icons.access_alarm_outlined,
        color: Color(0xff9CA3AF),
      ),
    ),
  );
}
