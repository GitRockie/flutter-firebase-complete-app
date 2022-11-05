import 'package:get/get.dart';

class DataUploader extends GetxController {
  @override
  void onReady() {
    uploadData();
    //Upload data to Firebase backend. Only get called once
    super.onReady();
  }

  void uploadData() {
    print('Data is uploading');
  }
}
