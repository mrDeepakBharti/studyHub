import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:study_hub/Service/ApiService/apiServices.dart';
import 'package:study_hub/View/Notes/model/categoriesResponse.dart';
import 'package:study_hub/View/PreviousYearPaper/Models/paperResponse.dart';
import 'package:study_hub/View/PreviousYearPaper/Models/subjectCategory.dart';
import 'package:study_hub/utils/sharedPreference/localDatabase.dart';

class Pypapercontroller extends GetxController {
  RxBool isLoading = false.obs;

  RxInt selectedTab = 0.obs;
  RxInt selectedSubject = 0.obs;
  void selectTab(int index) {
    selectedTab.value = index;
    update();
  }

  void selectSub(int index) {
    selectedSubject.value = index;
    update();
  }

  RxList<CategoryData?> category = <CategoryData?>[].obs;
  RxList<subjectData?> subjectCategory = <subjectData?>[].obs;
  RxList<PapersByYear?> paperData = <PapersByYear?>[].obs;

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

  Future<void> getSubjectCategory({required String id}) async {
    try {
      isLoading.value = true;
      var apiResponse = await ApiServices().getData(
          api: 'api/category/get-category-subjects/${id}', isTokened: true);
      if (apiResponse == null) return null;

      var data = jsonDecode(apiResponse);
      isLoading.value = false;
      if (data['statusCode'] == 200) {
        SubjectCategoryResponse subjectCategoryResponse =
            SubjectCategoryResponse.fromMap(data);
        subjectCategory.assignAll(subjectCategoryResponse.result!.data!);
        kLogger.f(subjectCategoryResponse.toMap());
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> getPreviousPaper(
      {required String categoryId, required String subjectId}) async {
    try {
      isLoading.value = true;
      Map<String, String> request = <String, String>{
        'categoryId': categoryId,
        'subjectId': subjectId
      };
      var apiResponse = await ApiServices().postFormData(
          apiUrl: 'api/notes/get-previous-papers',
          isTokened: true,
          payloadObj: request);
      if (apiResponse == null) return null;

      var data = jsonDecode(apiResponse);
      isLoading.value = false;
      if (data['statusCode'] == 200) {
        PaperResponse paperResponse = PaperResponse.fromMap(data);
        paperData.assignAll(paperResponse.result!.papersByYear!);
        kLogger.f(paperResponse.toMap());
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
