import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/themes/custom_text_style.dart';
import 'package:flutter_application_1/controllers/question_paper/questions_controller_extention.dart';
import 'package:flutter_application_1/widgets/common/background_decoration.dart';
import 'package:flutter_application_1/widgets/common/custom_app_bar.dart';
import 'package:flutter_application_1/widgets/content_area.dart';
import 'package:flutter_application_1/widgets/questions/answer_card.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../controllers/question_paper/questions_controller.dart';
import '../../widgets/questions/question_number_card.dart';

class ResultScreen extends GetView<QuestionsController> {
  const ResultScreen({super.key});
  static const String routeName = "/resultscreen";

  @override
  Widget build(BuildContext context) {
    Color _textColor =
        Get.isDarkMode ? Colors.white : Theme.of(context).primaryColor;
    return Scaffold(
        body: BackgrounDecoration(
            child: Column(
      children: [
        CustomAppBar(
            leading: const SizedBox(
              height: 80,
            ),
            title: controller.correctAnsweredQuestions),
        Expanded(
            child: ContentArea(
                child: Column(
          children: [
            SvgPicture.asset('assets/images/bulb.svg'),
            //const SizedBox(
            // height: 16,
            //),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 5),
              child: Text(
                'This is the result!',
                style: headerText.copyWith(color: _textColor),
              ),
            ),
            Text(
              'You have got ${controller.points} points.',
              style: TextStyle(color: _textColor),
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              'Tap the question number to see correct answers',
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 25,
            ),
            Expanded(
                child: GridView.builder(
                    itemCount: controller.allQuestions.length,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: Get.width ~/ 70,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 1,
                    ),
                    itemBuilder: (_, index) {
                      final _question = controller.allQuestions[index];
                      AnswerStatus _status = AnswerStatus.notAnswered;
                      final _selectedAnswer = _question.selectedAnswer;
                      final _correctAnswer = _question.correctAnswer;
                      if (_selectedAnswer == _correctAnswer) {
                        _status = AnswerStatus.correct;
                      } else if (_question.selectedAnswer == null) {
                        _status = AnswerStatus.incorrect;
                      } else {
                        _status = AnswerStatus.incorrect;
                      }
                      return QuestionNumberCard(
                        index: index + 1,
                        onTap: () =>
                            controller.jumpToQuestion(index, goBack: false),
                        status: _status,
                      );
                    }))
          ],
        )))
      ],
    )));
  }
}
