import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String? get uid => firebaseAuth.currentUser?.uid;
  Future<void> saveResult(double result) async {
    try {
      await firestore.collection("user").doc(uid).collection("bmiResults").add({
        "result": result,
        "time": FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print(e);
    }
  }

  Stream<QuerySnapshot> getResult() {
    return firestore
        .collection("user")
        .doc(uid)
        .collection("bmiResults")
        .snapshots();
  }
}
