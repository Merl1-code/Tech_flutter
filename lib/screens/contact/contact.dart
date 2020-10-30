import 'package:Tech_flutter/datastores/cloud/pings_store.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Tech_flutter/theme.dart' as theme;
import 'package:Tech_flutter/components/contacts/card.dart';
import 'package:Tech_flutter/datastores/local/contact_store.dart';
import 'package:Tech_flutter/datastores/cloud/ping_data.dart';

class ContactList extends StatefulWidget {
  @override
  ContactListState createState() {
    return ContactListState();
  }
}

class ContactListState extends State<ContactList> {
  Widget _renderContact(Contact contact) {
    // return FutureBuilder<PingData>(
    //   future: userPingsDatasForContact(contact.identifier),
    //   builder: (
    //     BuildContext context,
    //     AsyncSnapshot<PingData> pingSnapshot,
    //   ) {
    //     if (pingSnapshot.connectionState == ConnectionState.waiting) {
    //       return const Center(
    //         child: CircularProgressIndicator(
    //           backgroundColor: Colors.red,
    //         ),
    //       );
    //     } else if (pingSnapshot.hasError) {
    //       return const Text('errored');
    //     }

    //     final String lastPing = pingSnapshot.data.totalPing > 0
    //         ? pingSnapshot.data.totalPing.toString()
    //         : 'no ping yet';

    return ContactCard(
      name: contact.displayName,
      last: '0', //lastPing,
      photo:
          'https://scontent-rtl.akamaized.net/GED/09670000/9677800/9677861_700x0.webp',
      //onPressed: () {
      //store.pingContact(contact.phones.first.value);
      //     },
      //   );
      // },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ContactStore>(builder: (
      BuildContext context,
      ContactStore store,
      Widget child,
    ) {
      return FutureBuilder<Iterable<Contact>>(
        future: store.contacts,
        builder: (BuildContext context,
            AsyncSnapshot<Iterable<Contact>> contactSnapshot) {
          userPingsDatas();

          if (contactSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.red,
              ),
            );
          } else {
            return ListView.separated(
              padding: theme.spacings.bodyPadding,
              physics: const BouncingScrollPhysics(),
              itemCount: contactSnapshot.data.length,
              cacheExtent: 21,
              itemBuilder: (BuildContext context, int index) {
                return _renderContact(
                  contactSnapshot.data.elementAt(index),
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
