import 'package:Tech_flutter/components/contacts/card.dart';
import 'package:Tech_flutter/components/screen.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';

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

  List<Widget> _renderContacts(Iterable<Contact> data) {
    final List<Widget> cards = <Widget>[];

    for (int index = 0; index < data.length; index++) {
      final Contact contact = data.elementAt(index);

      cards.add(ContactCard(
        name: contact.displayName,
        last: '18h',
        photo:
            'https://scontent-rtl.akamaized.net/GED/09670000/9677800/9677861_700x0.webp',
      ));
      if (index < data.length - 1) {
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
          return Column(
            children: _renderContacts(snapshot.data),
          );
        }
      },
    );
  }
}
