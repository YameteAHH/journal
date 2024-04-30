import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference journals =
      FirebaseFirestore.instance.collection('journals');

  Future addJournal(String journal) {
    return journals.add({
      'journal': journal,
      'time_stamp': Timestamp.now(),
    });
  }

  Stream get getJournals {
    return journals.snapshots();
  }
}
