import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final auth = FirebaseAuth.instance;
final firestore = FirebaseFirestore.instance;

addHistory(String artist, String title) async {
  try {
    var fetchofData =
        await firestore.collection('History').doc('UserHistory').get();

    var mapOfdata = fetchofData.data();

    var listOflikes = mapOfdata!['historys'];

    listOflikes.add({"artist": artist, "title": title});

    await FirebaseFirestore.instance
        .collection('History')
        .doc('UserHistory')
        .set({'historys': listOflikes});
  } catch (e) {
    print(e);
  }
}
