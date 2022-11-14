import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/models/question_paper_model.dart';
import 'package:flutter_application_1/services/firebase_storage_service.dart';
import 'package:get/get.dart';

import '../../firebase_ref/references.dart';

class QuestionPaperController extends GetxController {
  final allPaperImages = <String>[].obs;
  final allPapers = <QuestionPaperModel>[].obs;

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
      'singing',
    ];
    try {
      //Creating new object and get the data
      QuerySnapshot<Map<String, dynamic>> data = await questionPaperRF.get();
      //returning a list of Paper
      final paperList = data.docs
          .map((paper) => QuestionPaperModel.fromSnapshot(paper))
          .toList();
      allPapers.assignAll(paperList);

      //Run a folder looping through

      for (var paper in paperList) {
        final imgUrl =
            await Get.find<FirebaseStorageService>().getImage(paper.title);

        //based on the 'title' we return th complete image path assigning each of this paper
        paper.imageUrl = imgUrl;
      }
      allPapers.assignAll(paperList);
    } catch (e) {
      print(e);
    }
  }
}
