//Light Theme Classmoor

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/themes/sub_theme_data_mixin.dart';

const Color primaryLightColorLight = Color(0xFF3ac3cb);
const Color primaryColorLight = Color(0xFFf85187);
const Color mainTextColorLight = Color.fromARGB(255, 40, 40, 40);

//Here we start using our mixin SubThemeData
class LightTheme with SubThemeData {
  ThemeData buildLightTheme() {
    final ThemeData systemLightTheme = ThemeData.light();
    return systemLightTheme.copyWith(
        primaryColor: primaryColorLight,
        iconTheme: getIconTheme(),
        textTheme: getTextTheme().apply(
            bodyColor: mainTextColorLight, displayColor: mainTextColorLight));
  }
}
