import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Tech_flutter/theme.dart' as theme;
import 'package:Tech_flutter/components/contacts/card.dart';
import 'package:Tech_flutter/datastore/datastore_interface.dart';
import 'package:Tech_flutter/datastore/ping_data.dart';

class ContactList extends StatefulWidget {
  @override
  ContactListState createState() {
    return ContactListState();
  }
}

class ContactListState extends State<ContactList> {
  Widget _renderContact(Contact contact, DatastoreInterface store) {
    final PingData ping =
        store.pingDataByPhoneNumber(contact.phones.first.value);

    return ContactCard(
      name: contact.displayName,
      last: ping?.totalPingNumber?.toString() ?? 'no ping',
      photo:
          'https://scontent-rtl.akamaized.net/GED/09670000/9677800/9677861_700x0.webp',
      onPressed: () {
        store.pingContact(contact.phones.first.value);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DatastoreInterface>(builder: (
      BuildContext context,
      DatastoreInterface store,
      Widget child,
    ) {
      return FutureBuilder<Iterable<Contact>>(
        future: store.contacts,
        builder:
            (BuildContext context, AsyncSnapshot<Iterable<Contact>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.red,
              ),
            );
          } else {
            return ListView.separated(
              padding: theme.spacings.bodyPadding,
              physics: const BouncingScrollPhysics(),
              itemCount: snapshot.data.length,
              cacheExtent: 21,
              itemBuilder: (BuildContext context, int index) {
                return _renderContact(
                  snapshot.data.elementAt(index),
                  store,
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 13);
              },
            );
          }
        },
      );
    });
  }
}
