import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class DataUploader extends GetxController {
  @override
  void onReady() {
    //Place to upload data to Firebase backend. Only get called once
    uploadData();
    super.onReady();
  }

  Future<void> uploadData() async {
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
    //read the content in a loop
    for (var paper in papersInAssets) {
      String stringPaperContent = await rootBundle.loadString(paper);
      print(stringPaperContent);
    }
  }
}
