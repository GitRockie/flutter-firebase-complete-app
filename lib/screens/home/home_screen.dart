import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/themes/app_colors.dart';
import 'package:flutter_application_1/configs/themes/app_icons.dart';
import 'package:flutter_application_1/configs/themes/custom_text_style.dart';
import 'package:flutter_application_1/configs/themes/ui_parameters.dart';

import 'package:flutter_application_1/controllers/question_paper/question_paper_controller.dart';
import 'package:flutter_application_1/screens/home/question_card.dart';
import 'package:flutter_application_1/screens/widgets/content_area.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //savin Controller instance
    QuestionPaperController _questionPaperController = Get.find();
    return Container(
        //decoration: BoxDecoration(gradient: mainGradient()),
        color: Colors.indigo,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(mobileScreenPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      AppIcons.menuLeft,
                      color: Colors.red,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(mobileScreenPadding),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.accessibility_new_outlined,
                                color: Colors.red,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                'Hello! I am The BIG TITLE!',
                                style: detailText.copyWith(
                                    color: onSurfaceTextColor),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: ContentArea(
                  addPadding: false,
                  child: Obx(
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
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
