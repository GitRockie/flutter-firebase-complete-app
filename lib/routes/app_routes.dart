import 'package:flutter_application_1/controllers/zoom_drawer_controller.dart';
import 'package:flutter_application_1/screens/home/home_screen.dart';
import 'package:flutter_application_1/screens/introduction/introduction.dart';
import 'package:flutter_application_1/screens/login/login_screen.dart';
import 'package:flutter_application_1/screens/question/question_screen.dart';
import 'package:flutter_application_1/screens/question/result_screen.dart';
import 'package:flutter_application_1/screens/question/test_overview_screen.dart';
import 'package:get/get.dart';

import '../controllers/question_paper/questions_controller.dart';
import '../controllers/question_paper_controller.dart';
import '../screens/splash/splash_screen.dart';

class AppRoutes {
  static List<GetPage> routes() => [
        GetPage(name: '/', page: () => const SplashScreen()),
        GetPage(
            name: '/introduction', page: () => const AppIntroductionScreen()),
        GetPage(
            name: '/home',
            page: () => const HomeScreen(),
            binding: BindingsBuilder(() {
              Get.put(QuestionPaperController());
              Get.put(CustomZoomDrawerController());
            })),
        GetPage(name: LoginScreen.routeName, page: () => const LoginScreen()),
        GetPage(
            name: QuestionScreen.routeName,
            page: () => const QuestionScreen(),
            binding: BindingsBuilder((() {
              Get.put<QuestionsController>(QuestionsController());
            }))),
        //This Page is coming from above QuestionScreen()
        GetPage(
          name: TestOverviewScreen.routeName,
          page: () => const TestOverviewScreen(),
        ),
        GetPage(name: ResultScreen.routeName, page: () => const ResultScreen())
      ];
}
