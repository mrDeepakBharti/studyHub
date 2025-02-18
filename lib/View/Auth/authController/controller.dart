import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_hub/Route/RouteName.dart';
import 'package:study_hub/Service/ApiService/apiServices.dart';
import 'package:study_hub/Service/baseController.dart';
import 'package:study_hub/View/Auth/otp.dart';
import 'package:study_hub/main.dart';
import 'package:study_hub/utils/sharedPreference/localDatabase.dart';

class AuthController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();

  TextEditingController signupEmail = TextEditingController();
  TextEditingController signuPassword = TextEditingController();

  TextEditingController otp = TextEditingController();
  MainController main = Get.put(MainController());
  RxInt timeRemaining = 120.obs;
  Timer? _timer;
  void startTimer() {
    timeRemaining.value = 30;
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (timeRemaining.value > 0) {
        timeRemaining.value--;
      } else {
        timer.cancel();
      }
    });
  }

  Future<bool> userLogin({
    required String email,
    required String password,
  }) async {
    Map<String, String> requestBody = <String, String>{
      'email': email,
      'password': password,
      'fcmToken': main.fcmToken.toString()
    };

    BaseController().showLoading();
    kLogger.i(requestBody);

    var apiResponse = await ApiServices()
        .postFormData(
      apiUrl: "api/user/login",
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

      kLogger.i(data["result"]['token'].toString());
      UserSimplePreferences.setProfileToken(data['result']['token'].toString());
      Get.offAllNamed(RouteName.bottomNav);

      return true;
    } else {
      BaseController().hideLoading();

      kLogger.i(data["message"].toString());

      return false;
    }
  }

  Future<bool> signup({
    required String fullName,
    required String email,
    required String password,
  }) async {
    Map<String, String> requestBody = <String, String>{
      'name': fullName,
      'email': email,
      'password': password,
    };

    BaseController().showLoading();
    kLogger.i(requestBody);

    var apiResponse = await ApiServices()
        .postFormData(
      apiUrl: "api/user/create-user",
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
    kLogger.f(data);
    BaseController().hideLoading();

    if (data["statusCode"] == 201) {
      BaseController().hideLoading();

      kLogger.i(data["result"]["email"].toString());
      Get.to(
          (() => SignupOtp(
                isForResetPassword: false,
              )),
          arguments: {'email': email});

      return true;
    } else {
      BaseController().hideLoading();

      kLogger.i(data["message"].toString());

      return false;
    }
  }

  Future<bool> verifyOtp({
    required String email,
    required String otp,
  }) async {
    Map<String, String> requestBody = <String, String>{
      'email': email,
      'otp': otp,
      'fcmToken': main.fcmToken.toString()
    };

    BaseController().showLoading();
    kLogger.i(requestBody);

    var apiResponse = await ApiServices()
        .postFormData(
      apiUrl: "api/user/verify-otp",
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

      kLogger.i(data["result"]['token'].toString());
      UserSimplePreferences.setProfileToken(data['result']['token'].toString());
      // Get.offAllNamed(RouteName.bottomNav);

      return true;
    } else {
      BaseController().hideLoading();

      kLogger.i(data["message"].toString());

      return false;
    }
  }

  Future<bool> resendOtp({
    required String email,
  }) async {
    Map<String, String> requestBody = <String, String>{
      'email': email,
    };

    BaseController().showLoading();
    kLogger.i(requestBody);

    var apiResponse = await ApiServices()
        .postFormData(
      apiUrl: "api/user/send-otp",
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

      Get.snackbar(data['result']['OTP'], data['message']);

      return true;
    } else {
      BaseController().hideLoading();

      kLogger.i(data["message"].toString());
      Get.snackbar(data['result']['OTP'], data['message']);

      return false;
    }
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
