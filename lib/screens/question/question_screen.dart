import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/themes/custom_text_style.dart';
import 'package:flutter_application_1/firebase_ref/loading_status.dart';

import 'package:flutter_application_1/widgets/common/background_decoration.dart';
import 'package:flutter_application_1/widgets/common/question_placeholder.dart';
import 'package:flutter_application_1/widgets/content_area.dart';
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
                const Expanded(
                    child: ContentArea(child: QuestionScreenHolder())),
              if (controller.loadingStatus.value == LoadingStatus.completed)
                Expanded(
                    child: ContentArea(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          controller.currentQuestion.value!.question,
                          style: questionText,
                        ),
                        GetBuilder<QuestionsController>(builder: (context) {
                          return ListView.separated(
                            itemBuilder: (BuildContext context, int index) {
                              final answer = controller
                                  .currentQuestion.value!.answers[index];
                              return Container();
                            },
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const SizedBox(
                              height: 10,
                            ),
                            itemCount: controller
                                .currentQuestion.value!.answers.length,
                          );
                        })
                      ],
                    ),
                  ),
                ))
            ],
          )),
    ));
  }
}
