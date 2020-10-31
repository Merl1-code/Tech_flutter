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
  Widget _renderContact(ContactWithPing data) {
    return ContactCard(
      name: data.contact.displayName,
      last:
          data?.ping?.lastPing?.toString() ?? 'Never being pinged', //lastPing,
      photo:
          'https://scontent-rtl.akamaized.net/GED/09670000/9677800/9677861_700x0.webp',
      onPressed: () {
        //store.pingContact(contact.phones.first.value);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ContactStore>(builder: (
      BuildContext context,
      ContactStore store,
      Widget child,
    ) {
      print("store:");
      print(store != null);

      return FutureBuilder<GloablContactDatas>(
        future: store.contacts,
        builder: (
          BuildContext context,
          AsyncSnapshot<GloablContactDatas> contactSnapshot,
        ) {
          //userPingsDatas();

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
              itemCount: 10,
              cacheExtent: 21,
              itemBuilder: (BuildContext context, int index) {
                print(contactSnapshot);
                return _renderContact(
                  contactSnapshot.data.contacts[index],
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
