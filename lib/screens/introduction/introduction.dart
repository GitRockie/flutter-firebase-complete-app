import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/widgets/app_circle_button.dart';
import 'package:get/get.dart';

class AppIntroductionScren extends StatelessWidget {
  const AppIntroductionScren({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.star,
                size: 65,
                color: Colors.amber,
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                  'Play and study with awesome Classmoor App right now!\nLearn whatever you want, find your teachers, or create your own classes.\nShare yor knowledge and results with friends!'),
              const SizedBox(
                height: 40,
              ),
              AppCircleButton(
                onTap: () => null,
                child: const Icon(
                  Icons.arrow_forward_ios,
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
