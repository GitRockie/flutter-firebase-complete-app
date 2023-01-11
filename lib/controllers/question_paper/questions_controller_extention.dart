import 'package:flutter_application_1/controllers/question_paper/questions_controller.dart';

extension QuestionControllerExtension on QuestionsController {
  //Number of correct questions count
  int get correctQuestionCount => allQuestions
      .where((element) => element.selectedAnswer == element.correctAnswer)
      .toList()
      .length;

  //Correct answered questions
  String get correctAnsweredQuestions {
    return '$correctQuestionCount out of ${allQuestions.length} correct';
  }
}
