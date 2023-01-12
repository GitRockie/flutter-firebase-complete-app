import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/controllers/question_paper/questions_controller.dart';
import 'package:get/get.dart';

import '../../firebase_ref/references.dart';
import '../auth_controller.dart';

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

  String get points {
    var points = (correctQuestionCount / allQuestions.length) *
        100 *
        (questionPaperModel.timeSeconds - remainSeconds) /
        questionPaperModel.timeSeconds *
        100;
    return points.toStringAsFixed(2);
  }

  Future<void> saveTestResults() async {
    var batch = fireStore.batch();
    //Check if the User exisit
    User? _user = Get.find<AuthController>().getUser();
    if (_user == null) {
      return;
    }

    //Creating sub-documents for a certain user,basing on sub-Collections
    batch.set(
        userRF
            .doc(_user.email)
            .collection('my_recent_tests')
            .doc(questionPaperModel.id),
        {
          //New fields for sub-collections
          "points": points,
          "correct_answer": '$correctQuestionCount/${allQuestions.length}',
          "question_id": questionPaperModel.id,
          "time": questionPaperModel.timeSeconds - remainSeconds
        });
    batch.commit();
    navigateToHomeScreen();
  }
}
