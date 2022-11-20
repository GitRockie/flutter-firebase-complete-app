import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomZoomDrawerController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();

  @override
  void onReady() {
    super.onReady();
  }

  void toggleDrawer() {
    zoomDrawerController.toggle?.call();
    update();
  }

  //Firebase Google method create for Sign Out and signIn
  void signOut() {}

  void signIn() {}

  void meOnGit() {}
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
    if (!await launch(url)) {
      throw 'Could not launch $url';
    }
  }
}
