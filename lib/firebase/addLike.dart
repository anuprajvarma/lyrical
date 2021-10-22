import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final auth = FirebaseAuth.instance;
final firestore = FirebaseFirestore.instance;

addLike(String artist, String title) async {
  try {
    var fetchofData =
        await firestore.collection('likes').doc('documents').get();

    var mapOfdata = fetchofData.data();

    var listOflikes = mapOfdata!['likedLyrics'];

    listOflikes.add({"artist": artist, "title": title});

    await FirebaseFirestore.instance
        .collection('likes')
        .doc('documents')
        .set({'likedLyrics': listOflikes});
  } catch (e) {
    print(e);
  }
}
