import 'package:flutter/material.dart';
import 'package:Tech_flutter/theme.dart' as theme;
import 'package:Tech_flutter/components/contacts/card.dart';
import 'package:Tech_flutter/components/contact_api.dart';

class ContactList extends StatefulWidget {
  @override
  ContactListState createState() {
    return ContactListState();
  }
}

class ContactListState extends State<ContactList> {
  Widget _renderContact(ContactAPI api, ContactWithPing contactData) {
    String tmp = '';
    if (contactData.ping != null) {
      tmp = '${contactData.ping.lastPing} x${contactData.ping.totalPing}';
    } else {
      tmp = 'Never being pinged';
    }

    return ContactCard(
      name: contactData.contact.displayName,
      last: tmp,
      photo:
          'https://scontent-rtl.akamaized.net/GED/09670000/9677800/9677861_700x0.webp',
      onPressed: () {
        api.pingContact(contactData.contact.identifier, '<3');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ContactAPIProvider(
      builder: (BuildContext context, ContactAPI api, GlobalContactDatas data) {
        return FutureBuilder<List<ContactWithPing>>(
          future: api.getContactsByDate(descending: true),
          builder: (
            BuildContext context,
            AsyncSnapshot<List<ContactWithPing>> snapshot,
          ) {
            List<ContactWithPing> contactList = <ContactWithPing>[];
            if (snapshot.hasData) {
              contactList = snapshot.data;
            }

            return ListView.separated(
              padding: theme.spacings.bodyPadding,
              physics: const BouncingScrollPhysics(),
              itemCount: contactList.length,
              cacheExtent: 21,
              itemBuilder: (BuildContext context, int index) => _renderContact(
                api,
                contactList[index],
              ),
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 13);
              },
            );
          },
        );
        final List<ContactWithPing> contactList = data.contacts.values.toList();

        return ListView.separated(
          padding: theme.spacings.bodyPadding,
          physics: const BouncingScrollPhysics(),
          itemCount: contactList.length,
          cacheExtent: 1,
          itemBuilder: (BuildContext context, int index) => _renderContact(
            api,
            contactList[index],
          ),
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 13);
          },
        );
      },
    );
  }
}
