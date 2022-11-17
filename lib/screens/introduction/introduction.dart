import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/themes/app_colors.dart';

import 'package:flutter_application_1/screens/widgets/app_circle_button.dart';
import 'package:get/get.dart';

class AppIntroductionScreen extends StatelessWidget {
  const AppIntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: mainGradient()),
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.star,
                size: 65,
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, color: onSurfaceTextColor),
                  'Play and study with awesome Classmoor App right now! Learn whatever you want, find your teachers, or create your own classes. Share your knowledge and results with friends!'),
              const SizedBox(
                height: 40,
              ),
              AppCircleButton(
                onTap: () => Get.offAndToNamed("/home"),
                child: const Icon(
                  Icons.arrow_forward,
                  size: 35,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
