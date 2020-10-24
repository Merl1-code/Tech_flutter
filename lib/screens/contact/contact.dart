import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Tech_flutter/components/contacts/card.dart';
import 'package:Tech_flutter/ping_datas/ping_interface.dart';
import 'package:Tech_flutter/ping_datas/ping_data.dart';

class ContactList extends StatefulWidget {
  @override
  ContactListState createState() {
    return ContactListState();
  }
}

class ContactListState extends State<ContactList> {
  Future<Iterable<Contact>> _initContact() async {
    return await ContactsService.getContacts(withThumbnails: false);
  }

  List<Widget> _renderContacts(
      Iterable<Contact> contacts, PingInterface pings) {
    final List<Widget> cards = <Widget>[];

    for (int index = 0; index < contacts.length; index++) {
      final Contact contact = contacts.elementAt(index);
      final PingData ping =
          pings.pingDataByPhoneNumber(contact.phones.first.value);

      cards.add(ContactCard(
        name: contact.displayName,
        last: ping?.totalPingNumber?.toString() ?? 'no ping',
        photo:
            'https://scontent-rtl.akamaized.net/GED/09670000/9677800/9677861_700x0.webp',
        onPressed: () {
          pings.pingContact(contact.phones.first.value);
        },
      ));
      if (index < contacts.length - 1) {
        cards.add(const SizedBox(
          height: 13,
        ));
      }
    }
    return cards;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initContact(),
      builder:
          (BuildContext context, AsyncSnapshot<Iterable<Contact>> snapshot) {
        if (snapshot.data == null) {
          print('project snapshot data is: ${snapshot.data}');
          return const Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.red,
            ),
          );
        } else {
          return Consumer<PingInterface>(
            builder: (BuildContext context, PingInterface pings, Widget child) {
              return Column(
                children: _renderContacts(snapshot.data, pings),
              );
            },
          );
        }
      },
    );
  }
}
