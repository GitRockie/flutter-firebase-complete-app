import 'package:cloud_firestore/cloud_firestore.dart';

//Creating collection referecies
final fireStore = FirebaseFirestore.instance;
final questionPaperRF = fireStore.collection('questionPapers');
