import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/common/background_decoration.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({super.key});
  static const String routeName = '/questions';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BackgrounDecoration(
        chid: Center(child: Text('I am Here!')),
      ),
    );
  }
}
