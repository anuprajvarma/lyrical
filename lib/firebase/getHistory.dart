import 'package:cloud_firestore/cloud_firestore.dart';

Future<List> gethistory() async {
  Map<String, dynamic>? data;
  try {
    var fetchData = await FirebaseFirestore.instance
        .collection('History')
        .doc('UserHistory')
        .get();

    data = fetchData.data();

    print(data);

    return data!['historys'];
  } catch (e) {
    print(e);

    return data!['historys'];
  }
}
