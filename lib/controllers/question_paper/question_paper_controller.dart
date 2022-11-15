import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/models/question_paper_model.dart';
import 'package:flutter_application_1/services/firebase_storage_service.dart';
import 'package:get/get.dart';

import '../../firebase_ref/references.dart';

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
      //Query Snapshot get data of Collection from Reference file asyncronously
      QuerySnapshot<Map<String, dynamic>> data = await questionPaperRF.get();
      //Creating Map of Query Snapshot converting toList
      final paperList = data.docs
          .map((paper) => QuestionPaperModel.fromSnapshot(paper))
          .toList();

      allPapers.assignAll(paperList);
      //Run a folder loop to look through it

      for (var paper in paperList) {
        final imgUrl =
            await Get.find<FirebaseStorageService>().getImage(paper.title);
        //Based on tittle we get an image path name
        paper.imageUrl = imgUrl;
      }
      allPapers.assignAll(paperList);
    } catch (e) {
      print(e);
    }
  }
}
