import 'package:cloud_firestore/cloud_firestore.dart';

Future<List> getlyrics() async {
  Map<String, dynamic>? data;
  try {
    var fetchData = await FirebaseFirestore.instance
        .collection('likes')
        .doc('documents')
        .get();

    data = fetchData.data();

    print(data);

    return data!['likedLyrics'];
  } catch (e) {
    print(e);

    return data!['likedLyrics'];
  }
}
