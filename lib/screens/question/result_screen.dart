import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});
  static const String routeName = "/resultscreen";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('ResultScreen')),
    );
  }
}
