import 'package:cloud_firestore/cloud_firestore.dart';

Future<bool> checkLike(String artist, String title) async {
  var _firestore = FirebaseFirestore.instance;
  bool isLiked = false;
  try {
    var likesDoc = await _firestore.collection('likes').doc('documents').get();

    var mapOfData = likesDoc.data();
    var likes = mapOfData!['likedLyrics'];

    print(likes);

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
