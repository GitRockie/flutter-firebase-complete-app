import 'package:flutter/rendering.dart';
import 'package:flutter_application_1/services/firebase_storage_service.dart';
import 'package:get/get.dart';

class QuestionPaperController extends GetxController {
  final allPaperImages = <String>[].obs;

  @override
  void onReady() {
    getAllPapers();
    super.onReady();
  }

  Future<void> getAllPapers() async {
    //Names stored in Firebase backend
    List<String> imgName = [
      'capoeira',
      'chemistry',
      'maths',
      'physics',
    ];
    try {
      //Run a folder looping through
      //Based on the name we pass it gets the coplete img path
      for (var img in imgName) {
        final imgUrl =
            //await Get.put(FirebaseStorageService()).getImage(img);
            await Get.find<FirebaseStorageService>().getImage(img);

        allPaperImages.add(imgUrl!);
      }
    } catch (e) {
      print(e);
    }
  }
}
