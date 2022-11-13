//import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/bindings/initial_bindings.dart';
import 'package:flutter_application_1/configs/themes/app_light_theme.dart';
import 'package:flutter_application_1/controllers/theme_controller.dart';
import 'package:flutter_application_1/data_uploader_screen.dart';
import 'package:flutter_application_1/routes/app_routes.dart';
import 'package:flutter_application_1/screens/introduction/introduction.dart';
import 'package:flutter_application_1/screens/splash/splash_screen.dart';
import 'package:get/get.dart';

import 'configs/themes/app_dark_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  InitalBindings().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: Get.find<ThemeController>().darkTheme,
      //DarkTheme().buildDarkTheme(),
      //LightTheme().buildLightTheme(),
      debugShowCheckedModeBanner: false,
      getPages: AppRoutes.routes(),
    );
  }
}


//Firebase lifecycle is ready to initWithFire
/*Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: DataUploaderScreen(),
  ));
}*/
