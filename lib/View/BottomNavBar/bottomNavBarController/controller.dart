import 'package:get/get.dart';

class BottomNavBarController extends GetxController {
  RxInt currentIndex = 0.obs;

  void setCurrentIndex(RxInt index) {
    currentIndex = index;
  }
}
