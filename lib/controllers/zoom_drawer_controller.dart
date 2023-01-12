import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import 'auth_controller.dart';

class CustomZoomDrawerController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();
  Rxn<User?> user = Rxn();

  @override
  void onReady() {
    user.value = Get.find<AuthController>().getUser();
    super.onReady();
  }

  void toggleDrawer() {
    zoomDrawerController.toggle?.call();
    update();
  }

  //Firebase Google method create for Sign Out and signIn
  void signOut() {
    Get.find<AuthController>().signOut();
  }

  void signIn() {}

  void meOnGit() {
    _launch('https://github.com/GitRockie');
  }

  void facebook() {
    _launch('https://facebook.com');
  }

  //User send the email trough email client
  void email() {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'elromankos@gmail.com',
    );
    _launch(emailLaunchUri.toString());
  }

  //launching e-mail client from here
  Future<void> _launch(String url) async {
    if (!await launchUrl(Uri())) {
      throw 'Could not launch $url';
    }
  }
}
