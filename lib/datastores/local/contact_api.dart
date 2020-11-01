import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:Tech_flutter/datastores/cloud/pings_store.dart';
import 'package:flutter_sms/flutter_sms.dart';

class ContactWithPing {
  ContactWithPing({this.contact, this.ping});
  Contact contact;
  PingData ping;
}

class GloablContactDatas {
  //contactId, ContactWithPing
  Map<String, ContactWithPing> contacts = <String, ContactWithPing>{};
}

class ContactAPI extends ChangeNotifier {
  GloablContactDatas _datas;

  Future<void> initialize() async {
    _datas = GloablContactDatas();
    //lunch both query in parallel
    final List<dynamic> datas = await Future.wait<dynamic>(<Future<dynamic>>[
      ContactsService.getContacts(withThumbnails: false),
      userPingsDatas(),
    ]);
    final Iterable<Contact> contacts = datas[0] as Iterable<Contact>;
    final GlobalPingsData pingsDatas = datas[1] as GlobalPingsData;

    print(contacts.length);

    for (final Contact contact in contacts) {
      print(contact.displayName);
      _datas.contacts[contact.identifier] = ContactWithPing(
        contact: contact,
        ping: pingsDatas.pings[contact.identifier],
      );
    }
  }

  Future<GloablContactDatas> get contacts async {
    if (_datas == null) {
      await initialize();
    }
    return _datas;
  }

  Future<void> _sendSMS(String message, List<String> recipents) async {
    FlutterSms.sendSMS(message: message, recipients: recipents)
        .catchError((dynamic onError) {
      print(onError);
    });
  }

  Future<bool> pingContact(String contactId) async {
    final ContactWithPing element = _datas.contacts[contactId];
    _sendSMS('test', <String>[element.contact.phones.first.value]);

    if (element.ping != null) {
      element.ping.totalPing += 1;
      element.ping.lastPing = DateTime.now();
    } else {
      element.ping = PingData(
        totalPing: 1,
        lastPing: DateTime.now(),
      );
    }

    _datas.contacts[contactId] = element;
    notifyListeners();
    return true;
  }
}
