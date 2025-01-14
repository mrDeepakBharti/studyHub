import 'package:get/get.dart';

class QuizController extends GetxController {
  var selectedOption = 0.obs;
  var questionIndex = 1.obs; // Tracks current question (1-based index)
  var totalQuestions = 10;
  void selectOption(int value) {
    selectedOption.value = value;
  }

  double get progress => questionIndex.value / totalQuestions;
}
