import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/themes/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(gradient: mainGradient()),
        child: Image.asset(
          'assets/images/class_moor.png',
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
