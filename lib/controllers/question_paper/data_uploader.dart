import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/firebase_ref/references.dart';
import 'package:flutter_application_1/models/question_paper_model.dart';
import 'package:get/get.dart';

class DataUploader extends GetxController {
  @override
  void onReady() {
    //Place to upload data to Firebase backend. Only get called once
    uploadData();
    super.onReady();
  }

  Future<void> uploadData() async {
    //Place to get Firestore instance to send the data to the backend
    final fireStore = FirebaseFirestore.instance;

    //Uploading assets folder and items
    //AssetManifest.json saved inside 'manifestContent'
    final manifestContent = await DefaultAssetBundle.of(Get.context!)
        .loadString('AssetManifest.json');
    //Decoding process. Reading with Map
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    //Point the path I want, need to get the keys.
    //Load json file and print path
    final papersInAssets = manifestMap.keys
        .where((path) =>
            path.startsWith('assets/DB/papers') && path.contains('.json'))
        .toList();

    List<QuestionPaperModel> questionPapers = [];
    //read the content in a loop
    for (var paper in papersInAssets) {
      String stringPaperContent = await rootBundle.loadString(paper);
      questionPapers
          .add(QuestionPaperModel.fromJson(json.decode(stringPaperContent)));
    }
    //print('Items number ${questionPapers.length}');
    //print('Items description: ${questionPapers[0].description}');
    //print('Items number ${questionPapers[2].description}');

    //To upload multiple data to the backend
    var batch = fireStore.batch();

    for (var paper in questionPapers) {
      batch.set(questionPaperRF.doc(paper.id), {
        'title': paper.title,
        'img_url': paper.imageUrl,
        'Description': paper.description,
        'time_seconds': paper.timeSeconds,
        'questions_count': paper.questions == null ? 0 : paper.questions!.length
      });
    }

    //submit the operation
    await batch.commit();
  }
}
