import 'package:flutter/material.dart';

import 'package:flutter_application_1/controllers/question_paper/question_paper_controller.dart';
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
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            child: SizedBox(
              height: 200,
              width: 200,
              child: FadeInImage(
                image: NetworkImage(
                    _questionPaperController.allPaperImages[index]),
                placeholder: const AssetImage('assets/images/loading.gif'),
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 20,
          );
        },
        itemCount: _questionPaperController.allPaperImages.length,
      ),
    ));
  }
}
