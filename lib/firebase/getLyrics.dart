import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final auth = FirebaseAuth.instance;
Future<List> getlyrics() async {
  Map<String, dynamic>? data;
  try {
    final users = auth.currentUser;
    final uid = users!.uid;
    var fetchData =
        await FirebaseFirestore.instance.collection('Users').doc(uid).get();

    data = fetchData.data();

    print(data);

    //return data!['likedlyrics'];
  } catch (e) {
    print(e);
  }

  return data!['likedlyrics'];
}
