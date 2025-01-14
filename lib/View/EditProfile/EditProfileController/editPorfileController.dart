import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class Editporfilecontroller extends GetxController {
  TextEditingController fullName = TextEditingController();
  TextEditingController education = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController bio = TextEditingController();
  TextEditingController interestController = TextEditingController();

  var chips = <String>[].obs;

  void addChip(String text) {
    if (text.isNotEmpty) {
      chips.add(text);
      interestController.clear();
    }
  }

  void removeChip(String text) {
    chips.remove(text);
  }
}
