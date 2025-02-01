import 'dart:convert';

import 'package:get/get.dart';
import 'package:study_hub/Service/ApiService/apiServices.dart';
import 'package:study_hub/View/NcertBooks/Model/ncertBookResponse.dart';
import 'package:study_hub/View/Notes/model/categoriesResponse.dart';
import 'package:study_hub/utils/sharedPreference/localDatabase.dart';

class Ncertbookscontroller extends GetxController {
  RxBool isLoading = false.obs;
  // RxList<Book?> bookList = <Book?>[].obs;
  Rx<NcertData?> bookData = Rx<NcertData?>(null);

  var currentPage = 0.obs;
  RxInt totalPages = 0.obs;
  RxBool isInitiallyLoading = false.obs;
  RxBool isLoadMore = false.obs;
  RxInt selectedTab = 0.obs;

  // void selectTab(int index) {
  //   selectedTab.value = index;
  // }
  void selectTab(int index) {
    selectedTab.value = index;
    getBookList(
      Id: category[index]!.id.toString(),
    );
  }

  RxList<CategoryData?> category = <CategoryData?>[].obs;

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
        kLogger.f(categoriesResponse.result!.toMap());
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> getBookList({required String Id}) async {
    try {
      var apiResponse = await ApiServices()
          .getData(api: 'api/notes/get-ncert-books/${Id}', isTokened: true);
      if (apiResponse == null) return null;
      var data = jsonDecode(apiResponse);
      isLoading.value = false;
      if (data['statusCode'] == 200) {
        NcertBookResponse ncertBookResponse = NcertBookResponse.fromMap(data);

        bookData.value = ncertBookResponse.result;
        // currentPage.value = ncertBookResponse.result!.currentPage!;
        // totalPages.value = ncertBookResponse.result!.totalPage!;
        kLogger.f(ncertBookResponse.result!.toMap());
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
