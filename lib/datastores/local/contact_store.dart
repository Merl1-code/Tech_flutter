import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';

class ContactStore extends ChangeNotifier {
  Iterable<Contact> _contacts;

  Future<Iterable<Contact>> get contacts async {
    _contacts =
        _contacts ?? await ContactsService.getContacts(withThumbnails: false);
    return _contacts;
  }
}
