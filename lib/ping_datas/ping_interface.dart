import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'ping_data.dart';

class PingInterface extends ChangeNotifier {
  final Map<String, PingData> _pingDatas = <String, PingData>{
    '0652179408': PingData()
  };

  UnmodifiableMapView<String, PingData> get pingDatas =>
      UnmodifiableMapView<String, PingData>(_pingDatas);

  UnmodifiableMapView<String, PingData> get pingDatasSortedByDate =>
      UnmodifiableMapView<String, PingData>(_pingDatas);

  UnmodifiableMapView<String, PingData> get pingDatasSortedByPingNumber =>
      UnmodifiableMapView<String, PingData>(_pingDatas);

  PingData pingDataByPhoneNumber(String phoneNumber) {
    return _pingDatas[phoneNumber];
  }

  PingData get lastPing {
    return _pingDatas[0];
  }

  int get totalPing => 0;

  void _sendSMS(String message, List<String> recipents) async {
    print("sending sms...");
    String _result =
        await FlutterSms.sendSMS(message: message, recipients: recipents)
            .catchError((e) {
      return "err";
    });
    print("res!!!");
    print(_result);
  }

  void pingContact(String phoneNumber) {
    final PingData ping = _pingDatas[phoneNumber] ?? PingData();

    _sendSMS("Hello world", [phoneNumber]);
    ping.totalPingNumber += 1;
    ping.lastPing = DateTime.now();
    _pingDatas[phoneNumber] = ping;
    notifyListeners();
  }
}
