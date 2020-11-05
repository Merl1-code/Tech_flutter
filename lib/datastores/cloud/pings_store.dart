import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'ping_data.dart';

export 'ping_data.dart';

PingData _docToPingData(DocumentSnapshot doc) {
  try {
    final Timestamp t = doc['lastPing'] as Timestamp;
    return PingData(
      totalPing: doc['totalPings'] as int,
      lastPing: t.toDate(),
    );
  } catch (e) {
    return null;
  }
}

Map<String, dynamic> _pingDataToDocField(PingData ping) {
  return <String, dynamic>{
    'totalPings': ping.totalPing,
    'lastPing': ping.lastPing,
  };
}

Future<GlobalPingsData> userPingsDatas() async {
  final GlobalPingsData globalPings = GlobalPingsData();
  final String userId = FirebaseAuth.instance.currentUser.uid;

  try {
    final List<dynamic> futures = await Future.wait<dynamic>(<Future<dynamic>>[
      FirebaseFirestore.instance.collection('userPings/$userId/pings').get(),
      FirebaseFirestore.instance.collection('userPings').doc(userId).get()
    ]);

    //pings
    final QuerySnapshot pingsQuery = futures[0] as QuerySnapshot;
    if (pingsQuery.docs.isNotEmpty) {
      for (final DocumentSnapshot doc in pingsQuery.docs) {
        globalPings.pings[doc.id] = _docToPingData(doc);
      }
    }

    //stats
    final DocumentSnapshot statsDocument = futures[1] as DocumentSnapshot;
    if (statsDocument.exists) {
      final Timestamp t = statsDocument['lastPing'] as Timestamp;
      globalPings.lastPing = t.toDate();
      globalPings.totalPings = statsDocument['totalPings'] as int;
    }
  } catch (e) {
    print(e);
    return globalPings;
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
    return _docToPingData(doc);
  }
  return null;
}

Future<bool> newPingData() async {
  return true;
}

Future<bool> setGlobalPingStats(
  int totalPingNumber,
  DateTime lastPingTime,
) async {
  final String userId = FirebaseAuth.instance.currentUser.uid;
  try {
    await FirebaseFirestore.instance
        .collection('userPings/')
        .doc(userId)
        .set(<String, dynamic>{
      'totalPings': totalPingNumber,
      'lastPing': lastPingTime,
    });
  } catch (e) {
    return false;
  }
  return true;
}

Future<bool> setPingDataForContact(String contactId, PingData ping) async {
  final String userId = FirebaseAuth.instance.currentUser.uid;

  try {
    await FirebaseFirestore.instance
        .collection('userPings/$userId/pings')
        .doc(contactId)
        .set(
          _pingDataToDocField(ping),
        );
  } catch (e) {
    return false;
  }
  return true;
}
