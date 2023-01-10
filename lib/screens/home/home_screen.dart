import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/themes/app_colors.dart';
import 'package:flutter_application_1/configs/themes/app_icons.dart';
import 'package:flutter_application_1/configs/themes/custom_text_style.dart';
import 'package:flutter_application_1/configs/themes/ui_parameters.dart';

import 'package:flutter_application_1/controllers/zoom_drawer_controller.dart';
import 'package:flutter_application_1/screens/home/menu_screen.dart';
import 'package:flutter_application_1/screens/home/question_card.dart';

import 'package:flutter_application_1/widgets/content_area.dart';

import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

import '../../controllers/question_paper_controller.dart';

class HomeScreen extends GetView<CustomZoomDrawerController> {
  const HomeScreen({super.key});

  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    //savin Controller instance
    QuestionPaperController _questionPaperController = Get.find();
    return Scaffold(body: GetBuilder<CustomZoomDrawerController>(
      builder: (_) {
        return ZoomDrawer(
          borderRadius: 50.0,
          closeCurve: Curves.easeInBack,
          menuScreenWidth: double.maxFinite,
          controller: _.zoomDrawerController,
          showShadow: true,
          angle: 0.0,
          style: DrawerStyle.defaultStyle,
          menuBackgroundColor: Colors.white.withOpacity(0.5),
          slideWidth: MediaQuery.of(context).size.width * 0.74,
          menuScreen: const MyMenuScreen(),
          mainScreen: Container(
              decoration: BoxDecoration(gradient: mainGradient()),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(mobileScreenPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: controller.toggleDrawer,
                            child: const Icon(
                              AppIcons.menuLeft,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              children: [
                                const Icon(
                                  AppIcons.peace,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Hello, Moormate!',
                                  style: detailText.copyWith(
                                      color: onSurfaceTextColor),
                                )
                              ],
                            ),
                          ),
                          const Text(
                            'What do you want to study today?',
                            style: headerText,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: ContentArea(
                          addPadding: false,
                          child: Obx(
                            () => ListView.separated(
                              padding: UIParameters.mobileScreenPadding,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                return QuestionCard(
                                  model:
                                      _questionPaperController.allPapers[index],
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const SizedBox(
                                  height: 20,
                                );
                              },
                              itemCount:
                                  _questionPaperController.allPapers.length,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        );
      },
    ));
  }
}
