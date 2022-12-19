import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/themes/app_colors.dart';
import 'package:flutter_application_1/configs/themes/custom_text_style.dart';
import 'package:flutter_application_1/configs/themes/ui_parameters.dart';
import 'package:flutter_application_1/firebase_ref/loading_status.dart';

import 'package:flutter_application_1/widgets/common/background_decoration.dart';
import 'package:flutter_application_1/widgets/common/main_button.dart';
import 'package:flutter_application_1/widgets/common/question_placeholder.dart';
import 'package:flutter_application_1/widgets/content_area.dart';
import 'package:flutter_application_1/widgets/questions/answer_card.dart';
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
                    padding: const EdgeInsets.only(top: 25),
                    child: Column(
                      children: [
                        Text(
                          controller.currentQuestion.value!.question,
                          style: questionText,
                        ),
                        //Here we change our State immidately
                        GetBuilder<QuestionsController>(
                            id: 'answers_list',
                            builder: (context) {
                              return ListView.separated(
                                shrinkWrap: true,
                                padding: const EdgeInsets.only(top: 25),
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  final answer = controller
                                      .currentQuestion.value!.answers[index];
                                  return AnswerCard(
                                    answer:
                                        '${answer.identifier}.${answer.answer}',
                                    onTap: () {
                                      controller
                                          .selectedAnswer(answer.identifier);
                                    },
                                    isSelected: answer.identifier ==
                                        controller.currentQuestion.value!
                                            .selectedAnswer,
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) =>
                                        const SizedBox(
                                  height: 10,
                                ),
                                itemCount: controller
                                    .currentQuestion.value!.answers.length,
                              );
                            }),
                      ],
                    ),
                  ),
                )),
              ColoredBox(
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Padding(
                  padding: UIParameters.mobileScreenPadding,
                  child: Row(
                    children: [
                      Visibility(
                        visible: controller.isFirstQuestion,
                        child: SizedBox(
                          width: 55,
                          height: 55,
                          child: MainButton(
                            onTap: () {},
                            child: Icon(
                              Icons.arrow_back_ios_new,
                              color: Get.isDarkMode
                                  ? onSurfaceTextColor
                                  : Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )),
    ));
  }
}
