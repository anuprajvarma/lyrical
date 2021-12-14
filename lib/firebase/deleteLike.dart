import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _firestore = FirebaseFirestore.instance;
final auth = FirebaseAuth.instance;

deleteLike(String artist, String title) async {
  try {
    final users = auth.currentUser;
    final uid = users!.uid;
    var fetchofData = await _firestore.collection('Users').doc(uid).get();

    var mapOfdata = fetchofData.data();

    var listOflikes = mapOfdata!['likedlyrics'];

    var listofNewlikes = [];

    for (int i = 0; i < listOflikes.length; i++) {
      if (listOflikes[i]['artist'].compareTo(artist) == 0 &&
          listOflikes[i]['title'].compareTo(title) == 0) {
        continue;
        //await _firestore.collection('likes').doc('documents').delete();
      } else {
        listofNewlikes.add(listOflikes[i]);
      }
    }

    await FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .set({'likedlyrics': listofNewlikes});
  } catch (e) {
    print(e);
  }
}
