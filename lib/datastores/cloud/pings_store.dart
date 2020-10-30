import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'ping_data.dart';

export 'ping_data.dart';

Future<GlobalPingsData> userPingsDatas() async {
  final DocumentSnapshot doc = await FirebaseFirestore.instance
      .collection('pings')
      .doc(FirebaseAuth.instance.currentUser.uid)
      .get();
  if (doc.exists) {
    print("tets");
    print(doc.get('pings').toString());
  } else {
    print('don\'t exist');
  }
  return GlobalPingsData();
}

Future<PingData> userPingsDatasForContact(String contactId) async {
  final String userId = FirebaseAuth.instance.currentUser.uid;

  final QuerySnapshot query = await FirebaseFirestore.instance
      .collection('pings')
      .where('userId', isEqualTo: userId)
      .where('contactId', isEqualTo: contactId)
      .limit(1)
      .get();

  if (query.size > 0 && query.docs[0].exists) {
    query.docs[0].data();
    print('exits');
  } else {
    print('don\'t exist');
  }
  return PingData();
}

Future<bool> newPingData() async {
  return true;
}

Future<bool> setPingDataForContact(
  String contactId,
) async {
  return true;
}
