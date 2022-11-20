import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/configs/themes/app_colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static const String routeName = '/login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        alignment: Alignment.center,
        decoration: BoxDecoration(gradient: mainGradient()),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/class_moor.png',
              width: 180,
              height: 180,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 50),
              child: Text(
                'Get the access to the Classmoor Study App. Look around, explore the tests and have fun!',
                style: TextStyle(
                  color: onSurfaceTextColor,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
