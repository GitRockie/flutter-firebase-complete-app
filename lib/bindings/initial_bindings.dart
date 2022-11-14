import 'package:flutter_application_1/controllers/question_paper/auth_controller.dart';
import 'package:flutter_application_1/controllers/theme_controller.dart';


import 'package:get/get.dart';

import '../services/firebase_storage_service.dart';

class InitalBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController());
    Get.put(AuthController(), permanent: true);
    Get.lazyPut(() =>  FirebaseStorageService());
  }
}
