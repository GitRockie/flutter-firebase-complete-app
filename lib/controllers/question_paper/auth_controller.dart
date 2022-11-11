import 'package:get/get.dart';

class AuthController extends GetxController {
  @override
  void onReady() {
    //Here we enter navigation events, like snackbar, dialogs, or a new route, or async request.
    initAuth();
    super.onReady();
  }

  void initAuth() async {
    await Future.delayed(const Duration(seconds: 2));
    navigateToIntroduction();
  }

  void navigateToIntroduction() {
    Get.offAllNamed('/introduction');
  }
}
