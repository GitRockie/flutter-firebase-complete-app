import 'package:flutter/material.dart';
import 'package:flutter_application_1/firebase_ref/loading_status.dart';

import 'package:flutter_application_1/widgets/common/background_decoration.dart';
import 'package:flutter_application_1/widgets/common/question_placeholder.dart';
import 'package:get/get.dart';

import '../../controllers/question_paper/questions_controller.dart';

class QuestionScreen extends GetView<QuestionsController> {
  const QuestionScreen({super.key});
  static const String routeName = '/questions';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BackgrounDecoration(
      chid: Obx(() => Column(
            children: [
              //Conditional statement show first to avoid null
              if (controller.loadingStatus.value == LoadingStatus.loading)
                const Expanded(child: QuestionScreenHolder()),
              if (controller.loadingStatus.value == LoadingStatus.completed)
                Expanded(
                    child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(controller.currentQuestion.value!.question)
                    ],
                  ),
                ))
            ],
          )),
    ));
  }
}
