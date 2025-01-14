import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:study_hub/Service/ApiService/apiServices.dart';
import 'package:study_hub/Service/baseController.dart';
import 'package:study_hub/utils/sharedPreference/localDatabase.dart';

class ResetController extends GetxController {
  RxBool obscureText = false.obs;
  void toggle() {
    obscureText.value = !obscureText.value;
  }

  TextEditingController email = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  Future<bool> resetPassword({
    required String email,
    required String newPassword,
    required String confirmPassword,
  }) async {
    Map<String, String> requestBody = <String, String>{
      'email': email,
      'newPassword': newPassword,
      'confirmPassword': confirmPassword,
    };

    BaseController().showLoading();
    kLogger.i(requestBody);

    var apiResponse = await ApiServices()
        .postFormData(
      apiUrl: "api/user/reset-password",
      payloadObj: requestBody,
      isTokened: false,
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
}
