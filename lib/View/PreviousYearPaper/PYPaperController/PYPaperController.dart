import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class Pypapercontroller extends GetxController {
  RxInt selectedTab = 0.obs;
  RxInt selectedSubject = 0.obs;
  void selectTab(int index) {
    selectedTab.value = index;
  }

  void selectSub(int index) {
    selectedSubject.value = index;
  }
}
