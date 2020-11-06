import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Tech_flutter/theme.dart' as theme;
import 'package:Tech_flutter/components/contacts/card.dart';
import 'package:Tech_flutter/datastores/local/contact_api.dart';

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
      photo: contactData.contact.avatar,
      onPressed: () {
        api.pingContact(contactData.contact.identifier, '<3');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ContactAPI>(builder: (
      BuildContext context,
      ContactAPI contactAPI,
      Widget child,
    ) {
      return FutureBuilder<GlobalContactDatas>(
        future: contactAPI.contacts,
        builder: (
          BuildContext context,
          AsyncSnapshot<GlobalContactDatas> contactSnapshot,
        ) {
          if (contactSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.red,
              ),
            );
          } else {
            final List<ContactWithPing> contactList =
                contactSnapshot.data.contacts.values.toList();

            return ListView.separated(
              padding: theme.spacings.bodyPadding,
              physics: const BouncingScrollPhysics(),
              itemCount: contactList.length,
              cacheExtent: 1,
              itemBuilder: (BuildContext context, int index) => _renderContact(
                contactAPI,
                contactList[index],
              ),
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
