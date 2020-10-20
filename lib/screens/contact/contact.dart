import 'package:Tech_flutter/components/contacts/card.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';

class ContactList extends StatefulWidget {
  @override
  ContactListState createState() {
    return ContactListState();
  }
}

class ContactListState extends State<ContactList> {

  Future<Iterable<Contact>> initContact() async {
    return await ContactsService.getContacts(withThumbnails: false);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: FutureBuilder (
              future: initContact(),
              builder: (BuildContext context, AsyncSnapshot<Iterable<Contact>> snapshot) {
                if (snapshot.data == null) {
                  print('project snapshot data is: ${snapshot.data}');
                  return const Center(child: CircularProgressIndicator(),);
                } else {
                  return Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.separated(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        final Contact c = snapshot.data.elementAt(index);
                        return ContactCard(name: c.displayName, last: '18h', photo: 'https://scontent-rtl.akamaized.net/GED/09670000/9677800/9677861_700x0.webp');
                        },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(height: 15);
                        },
                    ),
                  );
                }
              }
              ),
        )
    );
  }
}