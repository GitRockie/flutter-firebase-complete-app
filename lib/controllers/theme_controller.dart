import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/themes/app_dark_theme.dart';
import 'package:flutter_application_1/configs/themes/app_light_theme.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  late ThemeData _darkTheme;
  late ThemeData _lightTheme;
  //onInit create to called immediately after the widget is allocated in memory.
  @override
  void onInit() {
    initializeThemeData();
    super.onInit();
  }

  //Method for init upthere .
  initializeThemeData() {
    _darkTheme = DarkTheme().buildDarkTheme();
    _lightTheme = LightTheme().buildLightTheme();
  }

  //A pair of getters here
  ThemeData get darkTheme => _darkTheme;
  ThemeData get lightTheme => _lightTheme;
}
