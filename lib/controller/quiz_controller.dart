import 'package:flutter/material.dart';
import '../models/quiz_model.dart';

class QuizController extends ChangeNotifier {
  List<QuizModel> quizList = [];
  int selectedIndex = -1;
  QuizModel? selectedQuizModel;

  void moveToNextQuestion() {
    if (selectedIndex < quizList.length - 1) {
      selectedIndex = selectedIndex + 1;
      selectedQuizModel = quizList[selectedIndex];
      notifyListeners();
    } 
  }
}
