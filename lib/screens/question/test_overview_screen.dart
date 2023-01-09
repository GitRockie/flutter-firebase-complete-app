import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/themes/app_colors.dart';
import 'package:flutter_application_1/configs/themes/custom_text_style.dart';
import 'package:flutter_application_1/configs/themes/ui_parameters.dart';

import 'package:flutter_application_1/controllers/question_paper/questions_controller.dart';
import 'package:flutter_application_1/screens/home/question_card.dart';

import 'package:flutter_application_1/widgets/common/background_decoration.dart';
import 'package:flutter_application_1/widgets/common/custom_app_bar.dart';
import 'package:flutter_application_1/widgets/content_area.dart';
import 'package:flutter_application_1/widgets/questions/answer_card.dart';
import 'package:flutter_application_1/widgets/questions/count_down_timer.dart';
import 'package:flutter_application_1/widgets/questions/question_number_card.dart';
import 'package:get/get.dart';

class TestOverviewScreen extends GetView<QuestionsController> {
  const TestOverviewScreen({super.key});
  static const String routeName = "/testoverview";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: CustomAppBar(
          title: controller.completedTest,
        ),
        body: BackgrounDecoration(
          child: Column(
            children: [
              Expanded(
                  child: ContentArea(
                      child: Column(
                children: [
                  Row(
                    children: [
                      CountDownTimer(
                        color: UIParameters.isDarkMode()
                            ? Theme.of(context).textTheme.bodyText1!.color
                            : Theme.of(context).primaryColor,
                        time: '',
                      ),
                      Obx(() => Text(
                            '${controller.time} is remaining',
                            style: countDownTimerStyle(),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: GridView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: controller.allQuestions.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: Get.width ~/ 70,
                            childAspectRatio: 1,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8),
                        itemBuilder: (_, index) {
                          AnswerStatus? _answerStatus;
                          if (controller.allQuestions[index].selectedAnswer !=
                              null) {
                            _answerStatus = AnswerStatus.answered;
                          }
                          return QuestionNumberCard(
                              index: index + 1,
                              status: _answerStatus,
                              onTap: () => controller.jumpToQuestion(index));
                        }),
                  ),
                ],
              )))
            ],
          ),
        ));
  }
}
