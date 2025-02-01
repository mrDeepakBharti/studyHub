import 'dart:convert';

import 'package:get/get.dart';
import 'package:study_hub/Service/ApiService/apiServices.dart';
import 'package:study_hub/View/Quiz/Models/QuizCategoriesModel.dart';

class QuizController extends GetxController {
  RxList quizCategory = <Datum?>[].obs;

  var selectedOption = 0.obs;
  var questionIndex = 1.obs; // Tracks current question (1-based index)
  var totalQuestions = 10;
  void selectOption(int value) {
    selectedOption.value = value;
  }

  double get progress => questionIndex.value / totalQuestions;

  RxBool isLoading = false.obs;
  Future<void> getPracticeQuiz() async {
    try {
      isLoading.value = true;
      var apiResponse = await ApiServices()
          .getData(api: 'api/quiz/quiz-categories', isTokened: true);
      if (apiResponse == null) return;

      var data = jsonDecode(apiResponse);
      isLoading.value = false;
      if (data['statusCode'] == 200) {
        PracticeQuizResponse practiceQuizResponse =
            PracticeQuizResponse.fromMap(data);
        quizCategory.value = practiceQuizResponse.result!.data!;
      }
    } catch (e) {
      print(e.toString());
    }
  }
  
}
