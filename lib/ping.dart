import 'package:flutter_sms/flutter_sms.dart';
import 'package:Tech_flutter/datastores/cloud/pings_store.dart';

Future<void> _sendSMS(String message, List<String> recipents) async {
  FlutterSms.sendSMS(message: message, recipients: recipents)
      .catchError((String e) {
    return 'err';
  });
}

void pingContact(String contactId, String phoneNumber,
    {String message = '<3'}) {
  _sendSMS(message, <String>[phoneNumber]);
  setPingDataForContact(contactId);
}
