import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final auth = FirebaseAuth.instance;
final firestore = FirebaseFirestore.instance;

addLike(String artist, String title) async {
  try {
    final users = auth.currentUser;
    final uid = users!.uid;
    var fetchofData = await firestore.collection('Users').doc(uid).get();

    var mapOfdata = fetchofData.data();

    var listOflikes = mapOfdata!['likedlyrics'];

    listOflikes.add({"artist": artist, "title": title});

    await FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .set({'likedlyrics': listOflikes});
  } catch (e) {
    print(e);
  }
}
