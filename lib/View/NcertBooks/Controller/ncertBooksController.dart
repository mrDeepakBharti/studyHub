import 'package:get/get.dart';

class Ncertbookscontroller extends GetxController {
  RxInt selectedTab = 0.obs;

  void selectTab(int index) {
    selectedTab.value = index;
  }
}
