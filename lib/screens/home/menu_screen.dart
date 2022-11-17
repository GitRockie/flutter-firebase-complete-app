import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/themes/app_colors.dart';

class MyMenuScreen extends StatelessWidget {
  const MyMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      decoration: BoxDecoration(gradient: mainGradient()),
      child: Theme(
          data: ThemeData(
              textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                      foregroundColor: onSurfaceTextColor))),
          child: SafeArea(
              child: Stack(
            children: [
              Positioned(
                  child: BackButton(
                color: Colors.white,
                onPressed: () {
                  print('You were tapped!');
                },
              ))
            ],
          ))),
    );
  }
}
