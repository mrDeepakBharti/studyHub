import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:study_hub/Service/ApiService/apiServices.dart';
import 'package:study_hub/View/Notes/model/categoriesResponse.dart';

class Notescontroller extends GetxController {
  RxBool isLoading = false.obs;
  RxInt selectedTab = 0.obs;
  RxList<CategoryData?> category = <CategoryData?>[].obs;
  void selectTab(int index) {
    selectedTab.value = index;
  }

  Future<void> getCategory() async {
    try {
      isLoading.value = true;
      var apiResponse = await ApiServices()
          .getData(api: 'api/category/get-category', isTokened: true);
      if (apiResponse == null) return null;

      var data = jsonDecode(apiResponse);
      isLoading.value = false;
      if (data['statusCode'] == 200) {
        CategoriesResponse categoriesResponse =
            CategoriesResponse.fromMap(data);
        category.assignAll(categoriesResponse.result!.categories!);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
