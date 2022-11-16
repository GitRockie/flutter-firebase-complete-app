//import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/bindings/initial_bindings.dart';
import 'package:flutter_application_1/configs/themes/app_light_theme.dart';
import 'package:flutter_application_1/controllers/theme_controller.dart';

import 'package:flutter_application_1/routes/app_routes.dart';

import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  InitalBindings().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: Get.find<ThemeController>().lightTheme,
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
