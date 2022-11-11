//Taking colors from themes and create color combination
import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/themes/app_dark_theme.dart';
import 'package:flutter_application_1/configs/themes/app_light_theme.dart';
import 'package:flutter_application_1/configs/themes/ui_parameters.dart';

const mainGradientLight = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryLightColorLight, primaryColorLight]);

const mainGradientDark = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryDarkColorDark, primaryColorDark]);

LinearGradient mainGradient(BuildContext context) =>
    UIParameters.isDarkMode(context) ? mainGradientDark : mainGradientLight;
