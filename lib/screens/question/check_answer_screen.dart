import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/themes/custom_text_style.dart';
import 'package:flutter_application_1/controllers/question_paper/questions_controller.dart';
import 'package:flutter_application_1/screens/question/result_screen.dart';
import 'package:flutter_application_1/widgets/common/background_decoration.dart';
import 'package:flutter_application_1/widgets/common/custom_app_bar.dart';
import 'package:flutter_application_1/widgets/content_area.dart';
import 'package:flutter_application_1/widgets/questions/answer_card.dart';
import 'package:get/get.dart';

class CheckAnswerScreen extends GetView<QuestionsController> {
  const CheckAnswerScreen({super.key});
  static const String routeName = "/checkanswer";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        titleWidget: Obx(
          () => Text(
            'Question ${(controller.questionIndex.value + 1).toString().padLeft(2, '0')}',
            style: appBarTextStyle,
          ),
        ),
        showActionIcon: true,
        onMenuActionTap: () {
          Get.toNamed(ResultScreen.routeName);
        },
      ),
      body: BackgrounDecoration(
          child: Center(
              child: Obx(() => Column(
                    children: [
                      Expanded(
                        child: ContentArea(
                            child: SingleChildScrollView(
                          padding: const EdgeInsets.only(top: 20),
                          child: Column(
                            children: [
                              Text(controller.currentQuestion.value!.question),
                              GetBuilder<QuestionsController>(
                                  id: 'answer_review_list',
                                  builder: (_) {
                                    return ListView.separated(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemBuilder: (_, index) {
                                          final answer = controller
                                              .currentQuestion
                                              .value!
                                              .answers[index];
                                          final selectedAnswer = controller
                                              .currentQuestion
                                              .value!
                                              .selectedAnswer;
                                          final correctAnswer = controller
                                              .currentQuestion
                                              .value!
                                              .correctAnswer;
                                          final String answerText =
                                              '${answer.identifier}.${answer.answer}';
                                          if (correctAnswer == selectedAnswer &&
                                              answer.identifier ==
                                                  selectedAnswer) {
                                            //correct answer
                                          } else if (selectedAnswer == null) {
                                            //not selected answer
                                          } else if (correctAnswer !=
                                                  selectedAnswer &&
                                              answer.identifier ==
                                                  selectedAnswer) {
                                            //incorrect answer
                                          } else if (correctAnswer ==
                                              answer.identifier) {
                                            //correct answer
                                          }
                                          return AnswerCard(
                                            answer: answerText,
                                            onTap: () {},
                                            isSelected: false,
                                          );
                                        },
                                        separatorBuilder: (_, index) {
                                          return const SizedBox(
                                            height: 10,
                                          );
                                        },
                                        itemCount: controller.currentQuestion
                                            .value!.answers.length);
                                  })
                            ],
                          ),
                        )),
                      )
                    ],
                  )))),
    );
  }
}
