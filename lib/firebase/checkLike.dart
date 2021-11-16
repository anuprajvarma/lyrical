import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final auth = FirebaseAuth.instance;

Future<bool> checkLike(String artist, String title) async {
  var _firestore = FirebaseFirestore.instance;
  bool isLiked = false;
  try {
    final users = auth.currentUser;
    final uid = users!.uid;
    var likesDoc = await _firestore.collection('Users').doc(uid).get();

    var mapOfData = likesDoc.data();
    var likes = mapOfData!['likedlyrics'];

    // print(likes);

    for (var like in likes) {
      print(like);
      if (like['artist'].compareTo(artist) == 0 &&
          like['title'].compareTo(title) == 0) {
        isLiked = true;
      }
    }
  } catch (e) {
    print(e);
  }

  return isLiked;
}
