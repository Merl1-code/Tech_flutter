import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'ping_data.dart';

export 'ping_data.dart';

Future<GlobalPingsData> userPingsDatas() async {
  final GlobalPingsData globalPings = GlobalPingsData();
  final String userId = FirebaseAuth.instance.currentUser.uid;

  final QuerySnapshot query = await FirebaseFirestore.instance
      .collection('userPings/$userId/pings')
      .get();

  if (query.docs.isNotEmpty) {
    for (final DocumentSnapshot doc in query.docs) {
      final String contactId = doc['contact_id'] as String;
      globalPings.pings[contactId] = PingData();
    }
  }

  return globalPings;
}

Future<PingData> userPingsDatasForContact(String contactId) async {
  final String userId = FirebaseAuth.instance.currentUser.uid;

  final DocumentSnapshot doc = await FirebaseFirestore.instance
      .collection('userPings/$userId/pings')
      .doc(contactId)
      .get();

  if (doc.exists) {
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
