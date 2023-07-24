import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FiresStoreMethods{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream get meetingsHistory => _firestore.collection('users')
      .doc(_auth.currentUser!.uid)
      .collection('meetings').snapshots();

  void addToMeetingHistory(String meetingName) async {
    try{
      await _firestore.collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('meetings')
          .add({'meetingName' : meetingName, 'createdAt' : DateTime.now(), });
    }catch(e){
      print(e);
    }

  }
}