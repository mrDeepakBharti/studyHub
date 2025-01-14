import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:study_hub/Service/app_exception.dart';
import 'package:study_hub/utils/constant/appConstant.dart';
import 'package:study_hub/utils/sharedPreference/localDatabase.dart';

class ApiServices {
  static const timeOutDuration = 120;

  Future<dynamic> getData(
      {required String api, required bool isTokened}) async {
    var uri = Uri.parse("$baseUrl$api");
    dynamic responseJson;

    try {
      var response = await http
          .get(uri,
              headers: !isTokened
                  ? {
                      'Content-Type': 'application/json',
                      'Accept': 'application/json',
                      //  'Authorization':
                      //   'Bearer ${UserSimplePreferences.getProfileToken().toString()}',
                    }
                  : {
                      'Content-Type': 'application/json',
                      'Accept': 'application/json',
                      'Authorization':
                          //  'Bearer 129|uhsKArDPmjkYAH0sKcrAjLxMRZXjsELbz6U9EKCX',
                          'Bearer ${UserSimplePreferences.getProfileToken().toString()}',
                    })
          .timeout(const Duration(seconds: timeOutDuration));

      responseJson = _processResponse(response);

      // return _processResponse(response);
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    } catch (e) {
      // FirebaseCrashlytics.instance.recordError(e, stack);
      kLogger.e(e);
    }
    return responseJson;
  }

  Future<dynamic> postFormData(
      {required String apiUrl,
      required bool isTokened,
      required dynamic payloadObj}) async {
    var uri = Uri.parse("$baseUrl$apiUrl");
    // Map<String, String> requestBody = <String, String>{
    //   'mobile_number': "8448806152"
    // };
    //var payload = json.encode(payloadObj);

    try {
      var request = http.MultipartRequest('POST', uri)
        ..fields.addAll(payloadObj);

      !isTokened
          ? request.headers.addAll({"Content-type": "multipart/form-data"})
          : request.headers.addAll({
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              'Authorization':
                  //  'Bearer 129|uhsKArDPmjkYAH0sKcrAjLxMRZXjsELbz6U9EKCX',
                  'Bearer ${UserSimplePreferences.getProfileToken().toString()}',
            });

      //  var response = await request.send();
      // var responses = await http.Response.fromStream(response);
      print(request);

      var response = await request
          .send()
          .timeout(const Duration(seconds: timeOutDuration));
      var responses = await http.Response.fromStream(response);
      print("responses $responses");
      print(response.statusCode);
      return _processResponse(responses);
    } on SocketException {
      Get.back();
      throw FetchDataException('Socket Exception ', uri.toString());
    } on TimeoutException {
      Get.back();
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    } catch (e) {
      //  FirebaseCrashlytics.instance.recordError(e, stack);
    }
  }

  Future<dynamic> postFormDataWithImage({
    required String endPoint,
    required bool isTokened,
    required List<XFile> photosFile,
    required List<String> photosNames,
    required dynamic payloadObj,
  }) async {
    var uri = Uri.parse("$baseUrl$endPoint");
    try {
      var request = http.MultipartRequest('POST', uri)
        ..fields.addAll(payloadObj);
      if (!isTokened) {
        request.headers['Content-Type'] = 'multipart/form-data';
      } else {
        request.headers.addAll({
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization':
              'Bearer ${UserSimplePreferences.getProfileToken().toString()}',
        });
      }
      for (int i = 0; i < photosFile.length; i++) {
        request.files.add(await http.MultipartFile.fromPath(
          photosNames[i],
          photosFile[i].path,
          filename: "${photosNames[i]}.jpg",
        ));
        kLogger.i(photosNames);
        kLogger.i(photosFile);
      }
      var response = await request.send();
      var responseData = await http.Response.fromStream(response);
      debugPrint("Response status: ${response.statusCode}");
      debugPrint("Response body: ${responseData.body}");
      return _processResponse(responseData);
    } on TimeoutException {
      Get.back();
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    } catch (e) {
      debugPrint("Error: $e");
      // Handle or log the error appropriately
      // FirebaseCrashlytics.instance.recordError(e, stack);
      rethrow; // Propagate the error up the call stack if needed
    }
  }

  Future<dynamic> uploadFile(
      {required String endPoint,
      required bool isTokened,
      required List<String> fileName,
      required List<XFile> filePath,
      required dynamic payloadObj}) async {
    var uri = Uri.parse("$baseUrl$endPoint");
    try {
      var request = http.MultipartRequest('POST', uri)
        ..fields.addAll(payloadObj);

      // Adding headers
      if (isTokened) {
        request.headers.addAll({
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization':
              'Bearer ${UserSimplePreferences.getProfileToken().toString()}',
        });
      }

      // Adding files
      for (int i = 0; i < filePath.length; i++) {
        request.files.add(
          await http.MultipartFile.fromPath(
            fileName[i],
            filePath[i].path,
            filename: basename(
                filePath[i].path), // Use the actual filename from the path
          ),
        );
      }

      var response = await request
          .send()
          .timeout(const Duration(seconds: timeOutDuration));

      var responses = await http.Response.fromStream(response);
      kLogger.i("responses $responses");
      kLogger.i(response.statusCode);
      return _processResponse(responses);
    } on TimeoutException {
      Get.back();
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    } catch (e) {
      kLogger.e("Error uploading file: $e");
      rethrow;
    }
  }

  dynamic _processResponse(http.Response response) async {
    switch (response.statusCode) {
      case 200:
        {
          var responseJson = utf8.decode(response.bodyBytes);
          return responseJson;
        }

      case 201:
        var responseJson = utf8.decode(response.bodyBytes);
        return responseJson;

      case 400:
        debugPrint(response.statusCode.toString());
        debugPrint("Error 400");

        throw BadRequestException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 401:
        debugPrint(response.statusCode.toString());
        debugPrint("Invalid Token - 401");

        // Show Snackbar
        Get.snackbar(
          "Authentication Error",
          "Session expired. Please log in again.",
          snackPosition: SnackPosition.BOTTOM,
        );

        // Erase all client data
        // (You need to implement the clearClientData() function to clear stored data)
        await UserSimplePreferences.clearAllData();

        // Navigate to login screen
        Get.offAllNamed('/login');

        throw UnAuthorizedException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      // debugPrint(response.statusCode.toString());
      // debugPrint("Invalid Token -401 ");
      //
      // throw UnAuthorizedException(
      //     utf8.decode(response.bodyBytes), response.request!.url.toString());

      case 403:
        debugPrint(response.statusCode.toString());
        debugPrint("Error 403");
        throw UnAuthorizedException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 422:
        debugPrint("Error 422");
        throw BadRequestException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      // case 500:
      default:
        debugPrint(response.statusCode.toString());
        log(response.body.toString());
        Get.back();
        throw FetchDataException(
            'Error occured while communicating with server with status code : ${response.statusCode}',
            response.request!.url.toString());

      //     default:
      // throw FetchDataException('Error accured while communicating with server'+
      //     'with status code' +response.statusCode.toString());
    }
  }
}
