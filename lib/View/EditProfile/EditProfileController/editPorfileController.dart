import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:study_hub/Service/ApiService/apiServices.dart';
import 'package:study_hub/Service/baseController.dart';
import 'package:study_hub/Widget/imagePicker.dart';
import 'package:study_hub/utils/sharedPreference/localDatabase.dart';

class Editporfilecontroller extends GetxController {
  TextEditingController fullName = TextEditingController();
  TextEditingController education = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController bio = TextEditingController();
  TextEditingController interestController = TextEditingController();
  var profileImage = Rx<XFile?>(null);

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

  Future<bool> editProfile({
    required String fullName,
    required String education,
    required String bio,
    required List<String> interests,
  }) async {
    Map<String, String> requestBody = <String, String>{
      'name': fullName,
      'bio': bio,
      'education': education,
      'interests': jsonEncode(interests),
    };

    BaseController().showLoading();
    kLogger.i(requestBody);

    var apiResponse = await ApiServices()
        .postFormData(
      apiUrl: "api/user/edit-profile",
      payloadObj: requestBody,
      isTokened: true,
    )
        .catchError((error) {
      BaseController().hideLoading();
      BaseController().handleError(error);
      kLogger.e(error);

      return false;
    });

    if (apiResponse == null) return false;

    final data = jsonDecode(apiResponse);
    BaseController().hideLoading();

    if (data["statusCode"] == 200) {
      BaseController().hideLoading();

      return true;
    } else {
      BaseController().hideLoading();

      kLogger.i(data["message"].toString());

      return false;
    }
  }

  Future<void> pickImage() async {
    ChooseImage imagePicker = ChooseImage(ImageSource.gallery);
    XFile? image = await imagePicker.getImage();
    if (image != null) {
      var result =
          await uploadProfile(imagesFile: [image], photoName: ['file']);
      if (result == true) {
        profileImage.value = image;
        update();
      }
    }
  }

  Future<bool> uploadProfile(
      {required List<XFile> imagesFile,
      required List<String> photoName}) async {
    try {
      Map<String, String> request = <String, String>{"file": ""};
      BaseController().showLoading();
      var apiResponse = await ApiServices()
          .postFormDataWithImage(
              endPoint: "api/user/edit-profile",
              isTokened: true,
              photosFile: imagesFile,
              photosNames: photoName,
              payloadObj: request)
          .catchError((e) {
        BaseController().hideLoading();
        Get.back();
        Get.snackbar("Failed to update profile", e.toString());
        return false;
      });
      if (apiResponse == null) return false;
      BaseController().hideLoading();

      final data = jsonDecode(apiResponse);
      if (data['statusCode'] == 200) {
        // ToastUtils.showToast(data['message']);

        return true;
      } else {
        // ToastUtils.showToast(data['message']);

        BaseController().hideLoading();

        return false;
      }
    } catch (e) {
      BaseController().hideLoading();
      return false;
    }
  }
}
