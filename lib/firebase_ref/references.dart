import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

//Creating collection referecies
final fireStore = FirebaseFirestore.instance;
final questionPaperRF = fireStore.collection('questionPapers');
//call the method questionRF passing paperId and questionId
DocumentReference questionRF({
  required String paperId,
  required String questionId,
}) => //return the doc. questionId
    questionPaperRF.doc(paperId).collection('questions').doc(questionId);


Reference get firebaseStorage => FirebaseStorage.instance.ref();

