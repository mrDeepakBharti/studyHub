import 'dart:convert';

import 'package:get/get.dart';
import 'package:study_hub/Service/ApiService/apiServices.dart';
import 'package:study_hub/View/Quiz/Models/QuizCategoriesModel.dart';
import 'package:study_hub/View/Quiz/Models/quizLevelModel.dart';
import 'package:study_hub/View/Quiz/Models/quizQuestionsResponse.dart';
import 'package:study_hub/utils/sharedPreference/localDatabase.dart';

class QuizController extends GetxController {
  RxList quizCategory = <Datum?>[].obs;

  RxList quizLevel = <QuizLevelData?>[].obs;
  RxList questions = <Question>[].obs;
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

  Future<void> getQuizLevel(String id) async {
    try {
      isLoading.value = true;
      var apiResponse = await ApiServices()
          .getData(api: 'api/quiz/quiz-categories-levels/$id', isTokened: true);
      if (apiResponse == null) return;

      var data = jsonDecode(apiResponse);
      isLoading.value = false;
      kLogger.i("Raw API Response: $data"); // Log full API response

      if (data['statusCode'] == 200) {
        QuizLevelResponse quizLevelResponse = QuizLevelResponse.fromMap(data);
        quizLevel.value = quizLevelResponse.result!.quizLevels!;
        kLogger.i(
            "Parsed Quiz Levels: ${quizLevelResponse.result!.quizLevels}"); // Log parsed data
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> getQuestions(String id) async {
    try {
      isLoading.value = true;
      var apiResponse = await ApiServices()
          .getData(api: 'api/quiz/quiz-questions/$id', isTokened: true);
      if (apiResponse == null) return;

      var data = jsonDecode(apiResponse);
      isLoading.value = false;
      kLogger.i("Raw API Response: $data"); // Log full API response

      if (data['statusCode'] == 200) {
        QuizQuestionsResponse quizQuestionsResponse =
            QuizQuestionsResponse.fromMap(data);
        questions.value = quizQuestionsResponse.result!.questions!;
        kLogger.i(
            "Parsed Quiz Questions: ${quizQuestionsResponse.result!.questions}"); // Log parsed data
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
