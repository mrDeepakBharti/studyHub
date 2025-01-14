import 'dart:convert';

import 'package:get/get.dart';
import 'package:study_hub/Service/ApiService/apiServices.dart';
import 'package:study_hub/View/Profile/model/profileResponseModel.dart';

class ProfileController extends GetxController {
  RxBool isLoading = false.obs;
  Rx<profileData?> profileDataRx = Rx<profileData?>(null);
  Future<void> getProfileData() async {
    try {
      isLoading.value = true;
      var apiResponse = await ApiServices()
          .getData(api: 'api/user/user-details', isTokened: true);
      if (apiResponse == null) return null;

      var data = jsonDecode(apiResponse);
      isLoading.value = false;
      if (data['statusCode'] == 200) {
        ProfileResponse profileResponse = ProfileResponse.fromMap(data);
        profileDataRx.value = profileResponse.result;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
