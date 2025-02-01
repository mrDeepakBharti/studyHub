import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:study_hub/Service/ApiService/apiServices.dart';
import 'package:study_hub/View/Notes/model/NotesResponse.dart';
import 'package:study_hub/View/Notes/model/categoriesResponse.dart';
import 'package:study_hub/utils/sharedPreference/localDatabase.dart';

class Notescontroller extends GetxController {
  RxBool isLoading = false.obs;
  RxInt selectedTab = 0.obs;
  RxList<CategoryData?> category = <CategoryData?>[].obs;
  Rx<NotesData?> notesData = Rx<NotesData?>(null);

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

  Future<void> getchNotes({required String Id}) async {
    try {
      var apiResponse = await ApiServices()
          .getData(api: 'api/notes/get-ncert-notes/${Id}', isTokened: true);
      if (apiResponse == null) return null;
      var data = jsonDecode(apiResponse);
      isLoading.value = false;
      if (data['statusCode'] == 200) {
        NotesResponse notesResponse = NotesResponse.fromMap(data);

        notesData.value = notesResponse.result;
        // currentPage.value = ncertBookResponse.result!.currentPage!;
        // totalPages.value = ncertBookResponse.result!.totalPage!;
        kLogger.f(notesResponse.result!.toMap());
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
