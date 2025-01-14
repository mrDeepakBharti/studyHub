import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Helpcontroller extends GetxController {
  RxBool isChecked = false.obs;

  TextEditingController description = TextEditingController();

  void toggleCheck() {
    isChecked.value = !isChecked.value;
  }
}
