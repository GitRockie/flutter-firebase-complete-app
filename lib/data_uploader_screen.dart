import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/question_paper/data_uploader.dart';
import 'package:get/get.dart';

class DataUploaderScreen extends StatelessWidget {
  DataUploaderScreen({super.key});
  DataUploader controller = Get.put(DataUploader());

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      
      body: Center(
        //the place we want to change value based on obs to uploading completed
        child: Text('uploading')),
    );
  }
}
