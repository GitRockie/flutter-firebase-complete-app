import 'package:flutter/material.dart';

import 'package:flutter_application_1/controllers/question_paper/questions_controller.dart';
import 'package:flutter_application_1/screens/home/question_card.dart';

import 'package:flutter_application_1/widgets/common/background_decoration.dart';
import 'package:flutter_application_1/widgets/common/custom_app_bar.dart';
import 'package:get/get.dart';

class TestOverviewScreen extends GetView<QuestionsController> {
  const TestOverviewScreen({super.key});
  static const String routeName = "/testoverview";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        title: 'Test Over',
      ),
      body: BackgrounDecoration(
          child: Center(
        child: Text('Test'),
      )),
    );
  }
}
