import 'package:cloud_firestore/cloud_firestore.dart';

Future<List> getlyrics() async {
  var fetchData = await FirebaseFirestore.instance
      .collection('likes')
      .doc('documents')
      .get();

  var mapOfdata = fetchData.data();

  return mapOfdata!['like'];
}
