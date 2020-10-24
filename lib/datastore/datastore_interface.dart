import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:contacts_service/contacts_service.dart';
import 'ping_data.dart';

class DatastoreInterface extends ChangeNotifier {
  final Map<String, PingData> _pingDatas = <String, PingData>{
    '0652179408': PingData()
  };
  Iterable<Contact> _contacts;

  Future<Iterable<Contact>> get contacts async {
    _contacts =
        _contacts ?? await ContactsService.getContacts(withThumbnails: false);
    return _contacts;
  }

  UnmodifiableMapView<String, PingData> get pingDatas {
    return UnmodifiableMapView<String, PingData>(_pingDatas);
  }

  UnmodifiableMapView<String, PingData> get pingDatasSortedByDate {
    return UnmodifiableMapView<String, PingData>(_pingDatas);
  }

  UnmodifiableMapView<String, PingData> get pingDatasSortedByPingNumber {
    return UnmodifiableMapView<String, PingData>(_pingDatas);
  }

  PingData pingDataByPhoneNumber(String phoneNumber) {
    return _pingDatas[phoneNumber];
  }

  PingData get lastPing {
    return _pingDatas[0];
  }

  int get totalPing => 0;

  Future<void> _sendSMS(String message, List<String> recipents) async {
    print('sending sms...');
    final String _result =
        await FlutterSms.sendSMS(message: message, recipients: recipents)
            .catchError((String e) {
      return 'err';
    });
    print('res!!!');
    print(_result);
  }

  void pingContact(String phoneNumber) {
    final PingData ping = _pingDatas[phoneNumber] ?? PingData();

    _sendSMS('Hello world', <String>[phoneNumber]);
    ping.totalPingNumber += 1;
    ping.lastPing = DateTime.now();
    _pingDatas[phoneNumber] = ping;
    notifyListeners();
  }
}
