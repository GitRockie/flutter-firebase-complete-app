import 'package:flutter_application_1/models/question_paper_model.dart';
import 'package:flutter_application_1/services/firebase_storage_service.dart';
import 'package:get/get.dart';

class QuestionPaperController extends GetxController {
  //Put the data in this Controller
  final allPaperImages = <String>[].obs;
  final allPapers = <QuestionPaperModel>[].obs;

  @override
  void onReady() {
    getAllPapers();
    super.onReady();
  }

  //Access the Data (List) from th UI
  Future<void> getAllPapers() async {
    //Names stored in Firebase backend
    List<String> imgName = [
      'capoeira',
      'chemistry',
      'maths',
      'physics',
      'singing',
    ];
    //Based on the name we pass it gets the coplete img path
    try {
      //Run a folder looping through

      for (var img in imgName) {
        final imgUrl = await Get.find<FirebaseStorageService>().getImage(img);

        allPaperImages.add(imgUrl!);
      }
    } catch (e) {
      print(e);
    }
  }
}
