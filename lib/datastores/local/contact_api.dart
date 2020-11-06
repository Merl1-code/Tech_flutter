import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:Tech_flutter/datastores/cloud/pings_store.dart';
import 'package:flutter_sms/flutter_sms.dart';

export 'package:Tech_flutter/datastores/cloud/pings_store.dart';

class ContactWithPing {
  ContactWithPing({this.contact, this.ping});
  Contact contact;
  MemoryImage image;
  PingData ping;
}

class GlobalContactDatas {
  int totalPings = 0;
  DateTime lastPing;
  List<String> contactPinged = <String>[];
  int contactsNotPinged; //not implemented
  Contact lastContactPinged; //not implemented
  Map<String, ContactWithPing> contacts = <String, ContactWithPing>{};
}

class ContactAPI extends ChangeNotifier {
  GlobalContactDatas _datas;

  Future<void> initialize() async {
    _datas = GlobalContactDatas();
    //lunch both query in parallel
    final List<dynamic> datas = await Future.wait<dynamic>(<Future<dynamic>>[
      ContactsService.getContacts(),
      userPingsDatas(),
    ]);
    final Iterable<Contact> contacts = datas[0] as Iterable<Contact>;
    final GlobalPingsData pingsDatas = datas[1] as GlobalPingsData;

    _datas.totalPings = pingsDatas.totalPings;
    _datas.lastPing = pingsDatas.lastPing;
    _datas.contactPinged = pingsDatas.contactPinged;

    for (final Contact contact in contacts) {
      _datas.contacts[contact.identifier] = ContactWithPing(
        contact: contact,
        ping: pingsDatas.pings[contact.identifier],
      );
    }
  }

  Future<GlobalContactDatas> get contacts async {
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

  Future<List<ContactWithPing>> getContactsByDate({
    bool descending = false,
  }) async {
    final Map<String, PingData> pings = await getPingsByDate(
      descending: descending,
    );
    final List<ContactWithPing> sortedList = <ContactWithPing>[];

    //add sorted pings datas with associated
    //contacted saved in loacl contact hash table
    pings.forEach((String contactId, PingData pingData) {
      try {
        sortedList.add(ContactWithPing(
          contact: _datas.contacts[contactId].contact,
          ping: pingData,
        ));
      } catch (e) {
        print(e);
      }
    });
    //then add missing contacts
    //cause it's possible a contact doesn't have
    //a ping data from firebase
    _datas.contacts.forEach((
      String contactId,
      ContactWithPing contactWithPing,
    ) {
      if (pings[contactId] == null) {
        sortedList.add(contactWithPing);
      }
    });
    return sortedList;
  }

  Future<List<ContactWithPing>> getContactsByScore({
    bool descending = false,
  }) async {
    final Map<String, PingData> pings = await getPingsByScore(
      descending: descending,
    );
    final List<ContactWithPing> sortedList = <ContactWithPing>[];

    //add sorted pings datas with associated
    //contacted saved in loacl contact hash table
    pings.forEach((String contactId, PingData pingData) {
      try {
        sortedList.add(ContactWithPing(
          contact: _datas.contacts[contactId].contact,
          ping: pingData,
        ));
      } catch (e) {
        print(e);
      }
    });
    //then add missing contacts
    //cause it's possible a contact doesn't have
    //a ping data from firebase
    _datas.contacts.forEach((
      String contactId,
      ContactWithPing contactWithPing,
    ) {
      if (pings[contactId] == null) {
        sortedList.add(contactWithPing);
      }
    });
    return sortedList;
  }

  Future<bool> pingContact(String contactId, String message) async {
    final ContactWithPing element = _datas.contacts[contactId];
    _sendSMS(message, <String>[element.contact.phones.first.value]);

    if (element.ping != null) {
      element.ping.totalPing += 1;
      element.ping.lastPing = DateTime.now();
    } else {
      element.ping = PingData(
        totalPing: 1,
        lastPing: DateTime.now(),
      );
    }

    //update local stats
    _datas.totalPings += 1;
    _datas.lastPing = DateTime.now();
    _datas.contacts[contactId] = element;
    if (!_datas.contactPinged.contains(contactId)) {
      _datas.contactPinged.add(contactId);
    }

    //update firestore
    setGlobalPingStats(
      _datas.totalPings,
      _datas.lastPing,
      _datas.contactPinged,
    );
    setPingDataForContact(
      contactId,
      element.ping,
    );
    notifyListeners();
    return true;
  }
}
