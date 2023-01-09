import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/themes/app_colors.dart';
import 'package:flutter_application_1/configs/themes/ui_parameters.dart';
import 'package:flutter_application_1/widgets/questions/answer_card.dart';
import 'package:get/get.dart';

class QuestionNumberCard extends StatelessWidget {
  const QuestionNumberCard(
      {super.key,
      required this.index,
      required this.status,
      required this.onTap});

  final int index;
  final AnswerStatus? status;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    Color _backgroundColor = Theme.of(context).primaryColor;

    switch (status) {
      case AnswerStatus.answered:
        _backgroundColor = Get.isDarkMode
            ? Theme.of(context).cardColor
            : Theme.of(context).primaryColor;
        break;

      case AnswerStatus.notAnswered:
        _backgroundColor = Get.isDarkMode
            ? Colors.red.withOpacity(0.5)
            : Theme.of(context).primaryColor.withOpacity(0.5);
        break;

      case AnswerStatus.correct:
        _backgroundColor = correctAnswerColor;
        break;

      case AnswerStatus.incorrect:
        _backgroundColor = inCorrectAnswerColor;
        break;

      default:
        _backgroundColor = Theme.of(context).primaryColor.withOpacity(0.1);
    }
    return InkWell(
      onTap: onTap,
      borderRadius: UIParameters.cardBorderRadius,
      child: Ink(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: _backgroundColor,
            borderRadius: UIParameters.cardBorderRadius),
        child: Center(
          child: Text(
            '$index',
            style: TextStyle(
                color: status == AnswerStatus.notAnswered
                    ? Theme.of(context).primaryColor
                    : null),
          ),
        ),
      ),
    );
  }
}
