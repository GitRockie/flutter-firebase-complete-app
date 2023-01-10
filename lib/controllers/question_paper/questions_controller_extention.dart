import 'package:flutter_application_1/controllers/question_paper/questions_controller.dart';

extension QuestionControllerExtension on QuestionsController {
  int get correctQuestionCount => allQuestions
      .where((element) => element.selectedAnswer == element.correctAnswer)
      .toList()
      .length;
}
