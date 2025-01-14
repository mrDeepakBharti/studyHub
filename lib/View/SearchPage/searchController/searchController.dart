import 'package:flutter/material.dart';
import 'package:get/get.dart';

// class Searchcontroller extends GetxController {
//   TextEditingController search = TextEditingController();
//   RxList<Map<String, dynamic>> filteredResults = <Map<String, dynamic>>[].obs;

//   void filterResults(String query, List<Map<String, dynamic>> allResults) {
//     if (query.isEmpty) {
//       filteredResults.assignAll(allResults);
//     } else {
//       filteredResults.assignAll(
//         allResults
//             .where((item) =>
//                 item['title'].toLowerCase().contains(query.toLowerCase()))
//             .toList(),
//       );
//     }
//   }

//   @override
//   void onInit() {
//     super.onInit();
//     filteredResults.addAll([
//       // Initial results (can be populated from an API or local list)
//     ]);
//   }
// }

class Searchcontroller extends GetxController {
  var search = TextEditingController();
  var filteredResults = [].obs;
  var recentSearches = <Map<String, String>>[].obs;

  void filterResults(String query, List<Map<String, dynamic>> results) {
    if (query.isNotEmpty) {
      filteredResults.value = results
          .where((item) => item['title']
              .toString()
              .toLowerCase()
              .contains(query.toLowerCase()))
          .toList();

      // Update recent searches
      addRecentSearch(query);
    } else {
      filteredResults.clear();
    }
  }

  void addRecentSearch(String query) {
    if (!recentSearches.any((item) => item['title'] == query)) {
      recentSearches.insert(0, {'title': query});
    }
    if (recentSearches.length > 5) {
      recentSearches.removeLast();
    }
  }
}
