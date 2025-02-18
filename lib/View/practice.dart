import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class WatchlistController extends GetxController {
  var selectedTab = 0.obs; // Watchlist tab selection

  var selectedwatchlist = 0.obs;
}

class WatchlistPage extends StatelessWidget {
  final WatchlistController controller = Get.put(WatchlistController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: Get.width,
                height: 181,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                decoration: BoxDecoration(
                  color: const Color(0xff00324D),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.r),
                    bottomRight: Radius.circular(20.r),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 23.h),
                    Row(
                      children: [
                        const Icon(Icons.handshake, color: Colors.white),
                        SizedBox(width: 10.w),
                        Text(
                          'Partner with angel one',
                          style:
                              TextStyle(color: Colors.white70, fontSize: 14.sp),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 100.h, left: 16.w, right: 16.w),
                child: Container(
                  width: Get.width,
                  padding:
                      EdgeInsets.symmetric(vertical: 30.h, horizontal: 16.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.r),
                    boxShadow: [
                      const BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Portfolio value',
                          style: TextStyle(
                              color: Colors.black54, fontSize: 14.sp)),
                      SizedBox(height: 5.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '₹13,240.11',
                            style: TextStyle(
                                fontSize: 24.sp, fontWeight: FontWeight.bold),
                          ),
                          RichText(
                            text: TextSpan(children: [
                              const TextSpan(
                                  text: 'Today',
                                  style: TextStyle(color: Colors.black)),
                              WidgetSpan(
                                child: Row(
                                  children: [
                                    Text(
                                      '  + 1.74%',
                                      style: TextStyle(
                                          color: const Color(0xff16A34A),
                                          fontSize: 12.sp),
                                    ),
                                    SizedBox(width: 5.w),
                                    Icon(Icons.arrow_circle_up,
                                        color: const Color(0xff16A34A),
                                        size: 16.sp),
                                  ],
                                ),
                              ),
                            ]),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Obx(
                () => Padding(
                  padding: EdgeInsets.only(top: 200.h, left: 16.w, right: 16.w),
                  child: Container(
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(140.r),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Stack(
                      children: [
                        AnimatedPositioned(
                          duration: const Duration(milliseconds: 250),
                          left: controller.selectedwatchlist.value == 0
                              ? 0
                              : MediaQuery.of(context).size.width * 0.45,
                          right: controller.selectedwatchlist.value == 1
                              ? 0
                              : MediaQuery.of(context).size.width * 0.45,
                          child: Container(
                            height: 50.h,
                            width: MediaQuery.of(context).size.width * 0.45,
                            decoration: BoxDecoration(
                              color: const Color(0xff33D49D),
                              borderRadius: BorderRadius.circular(140.r),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () =>
                                    controller.selectedwatchlist.value = 0,
                                child: Container(
                                  height: 50.h,
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Watchlist',
                                    style: TextStyle(
                                      color:
                                          controller.selectedwatchlist.value ==
                                                  0
                                              ? Colors.white
                                              : Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () =>
                                    controller.selectedwatchlist.value = 1,
                                child: Container(
                                  height: 50.h,
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Positions',
                                    style: TextStyle(
                                      color:
                                          controller.selectedwatchlist.value ==
                                                  1
                                              ? Colors.white
                                              : Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                  right: -20,
                  top: 70.h,
                  child: Image.asset(
                    'asset/images/Vector (1) 1.png',
                    height: 114.h,
                    width: 201.w,
                  ))
            ],
          ),

          // Watchlist Tabs

          // Search Box
          Obx(() {
            return controller.selectedwatchlist.value == 0
                ? Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                        ),
                        Obx(() => Padding(
                              padding: EdgeInsets.only(
                                  top: 20.h, left: 16.w, right: 16.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  _tabItem('Watchlist 1', 0),
                                  _tabItem('Watchlist 2', 1),
                                  _tabItem('Watchlist 3', 2),
                                ],
                              ),
                            )),
                        Expanded(
                          child: Obx(() {
                            switch (controller.selectedTab.value) {
                              case 0:
                                return _watchlist1();
                              case 1:
                                return _watchlist2();
                              case 2:
                                return _watchlist3();
                              default:
                                return _watchlist1();
                            }
                          }),
                        ),
                      ],
                    ),
                  )
                : Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color:
                                  const Color(0xff33D49D), // Background color
                              borderRadius:
                                  BorderRadius.circular(16), // Rounded corners
                            ),
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Portfolio value",
                                          style: TextStyle(
                                              color: Colors.white70,
                                              fontSize: 16),
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          "₹13,240.11",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "Positional P&L",
                                          style: TextStyle(
                                              color: Colors.white70,
                                              fontSize: 16),
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          "₹8876.78",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Row(
                                          children: [
                                            Text(
                                              "1.74%",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Icon(
                                              Icons.arrow_circle_up,
                                              color: Colors.white,
                                              size: 16,
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 12),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 5,
                                            backgroundColor: Colors.greenAccent,
                                          ),
                                          SizedBox(width: 6),
                                          Text(
                                            "margin: ₹234.11",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 5,
                                            backgroundColor: Colors.redAccent,
                                          ),
                                          SizedBox(width: 6),
                                          Text(
                                            "Invested Margin: ₹34.11",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView(
                            children: [
                              _stockItem(
                                  'TSLA', 'Tesla Inc', 765.30, 2.45, true),
                              _stockItem('GOOGL', 'Alphabet Inc', 2819.26,
                                  -1.21, false),
                              _stockItem(
                                  'NVDA', 'Nvidia Corp', 215.09, 0.78, true),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
          })

          // Watchlist Content
        ],
      ),
    );
  }

  Widget _tabItem(String title, int index) {
    return GestureDetector(
      onTap: () => controller.selectedTab.value = index,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: TextStyle(
              color: controller.selectedTab.value == index
                  ? const Color(0xff33D49D)
                  : const Color(
                      0xffAFAFAF), // More neutral gray for inactive state
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4.h), // Adds spacing between text and underline
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: controller.selectedTab.value == index
                ? 47.w
                : 0, // Dynamic underline width
            height: 2.h,
            color: controller.selectedTab.value == index
                ? const Color(0xff33D49D)
                : Colors.transparent,
          ),
        ],
      ),
    );
  }

  Widget _watchlist1() {
    return ListView(
      children: [
        _stockItem('AAPL', 'Apple, Inc', 142.65, 0.81, true),
        _stockItem('NFLX', 'Netflix, Inc', 88.91, 1.29, true),
        _stockItem('AMZN', 'Amazon, Inc', 3283.26, -0.05, false),
      ],
    );
  }

  Widget _watchlist2() {
    return ListView(
      children: [
        _stockItem('MSFT', 'Microsoft, Corp', 188.09, 2.02, true),
        _stockItem('F', 'Ford Motor', 14.06, -0.32, false),
        _stockItem('FB', 'Facebook, Inc', 343.01, 1.07, true),
      ],
    );
  }

  Widget _watchlist3() {
    return ListView(
      children: [
        _stockItem('AMD', 'Advance Micro.', 100.41, 1.19, true),
        _stockItem('ABSCI', 'ABSCI Corp', 11.82, -4.83, false),
      ],
    );
  }

  Widget _stockItem(String symbol, String name, double price, double change,
      bool isPositive) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(symbol,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              Text(name, style: const TextStyle(color: Colors.grey)),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('${price.toStringAsFixed(2)}',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              Text('${change > 0 ? '+' : ''}${change.toStringAsFixed(2)}%',
                  style: TextStyle(
                      color: isPositive ? Colors.green : Colors.red,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }
}
