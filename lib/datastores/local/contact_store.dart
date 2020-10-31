import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:Tech_flutter/datastores/cloud/pings_store.dart';

class ContactWithPing {
  ContactWithPing({this.contact, this.ping});
  Contact contact;
  PingData ping;
}

class GloablContactDatas {
  List<ContactWithPing> contacts = <ContactWithPing>[];
}

class ContactStore extends ChangeNotifier {
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

    for (final Contact contact in contacts) {
      _datas.contacts.add(ContactWithPing(
        contact: contact,
        ping: pingsDatas.pings[contact.identifier],
      ));
    }
  }

  Future<GloablContactDatas> get contacts async {
    if (_datas == null) {
      await initialize();
    }
    return _datas;
  }
}
