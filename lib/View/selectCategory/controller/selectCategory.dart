import 'package:get/get.dart';

class categoryController extends GetxController {
  var isSelected = ''.obs;
  void selected(String category) {
    isSelected.value = category;
  }
}
