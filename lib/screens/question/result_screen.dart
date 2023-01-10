import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/question_paper/questions_controller_extention.dart';
import 'package:get/get.dart';

import '../../controllers/question_paper/questions_controller.dart';

class ResultScreen extends GetView<QuestionsController> {
  const ResultScreen({super.key});
  static const String routeName = "/resultscreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(controller.correctQuestionCount.toString())),
    );
  }
}
