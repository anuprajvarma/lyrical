import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = FirebaseFirestore.instance;

deleteLike(String artist, String title) async {
  try {
    var fetchofData =
        await _firestore.collection('likes').doc('documents').get();

    var mapOfdata = fetchofData.data();

    var listOflikes = mapOfdata!['likedLyrics'];

    var listofNewlikes = [];

    for (int i = 0; i < listOflikes.length; i++) {
      if (listOflikes[i]['artist'].compareTo(artist) == 0 &&
          listOflikes[i]['title'].compareTo(title) == 0) {
        continue;
        //await _firestore.collection('likes').doc('documents').delete();
      } else {
        listofNewlikes.add(listOflikes[i]);
        print('yuvraj is bhadwa');
      }
    }

    await FirebaseFirestore.instance
        .collection('likes')
        .doc('documents')
        .set({'likedLyrics': listofNewlikes});
  } catch (e) {
    print(e);
  }
}
