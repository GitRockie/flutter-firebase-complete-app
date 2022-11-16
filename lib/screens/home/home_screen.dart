
import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/themes/ui_parameters.dart';

import 'package:flutter_application_1/controllers/question_paper/question_paper_controller.dart';
import 'package:flutter_application_1/screens/home/question_card.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //savin Controller instance
    QuestionPaperController _questionPaperController = Get.find();
    return Scaffold(
        body: Obx(
      () => ListView.separated(
        padding: UIParameters.mobileScreenPadding,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return QuestionCard(
            model: _questionPaperController.allPapers[index],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 20,
          );
        },
        itemCount: _questionPaperController.allPapers.length,
      ),
    ));
  }
}
