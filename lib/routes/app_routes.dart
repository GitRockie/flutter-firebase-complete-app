import 'package:flutter_application_1/screens/introduction/introduction.dart';
import 'package:get/get.dart';

import '../screens/splash/splash_screen.dart';

class AppRoutes {
  static List<GetPage> routes() => [
        GetPage(name: '/', page: () => const SplashScreen()),
        GetPage(
            name: '/introduction', page: () => const AppIntroductionScreen()),
      ];
}
