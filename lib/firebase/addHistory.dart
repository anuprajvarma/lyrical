import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final auth = FirebaseAuth.instance;
final firestore = FirebaseFirestore.instance;

addHistory(String artist, String title) async {
  print('anupraj bhot ganda hai');
  try {
    final users = auth.currentUser;
    final uid = users!.uid;
    var fetchofData = await firestore.collection('Historys').doc(uid).get();

    var mapOfdata = fetchofData.data();

    var listOflikes = mapOfdata!['history'];

    listOflikes.add({"artist": artist, "title": title});

    await FirebaseFirestore.instance
        .collection('Historys')
        .doc(uid)
        .set({'history': listOflikes});
  } catch (e) {
    print(e);
  }
}
