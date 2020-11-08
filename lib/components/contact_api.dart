import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Tech_flutter/datastores/local/contact_api.dart';

export 'package:Tech_flutter/datastores/local/contact_api.dart';

class ContactAPIProvider extends StatelessWidget {
  const ContactAPIProvider({this.builder});

  final Widget Function(
    BuildContext,
    ContactAPI,
    GlobalContactDatas,
  ) builder;

  @override
  Widget build(BuildContext context) {
    return Consumer<ContactAPI>(
      builder: (
        BuildContext context,
        ContactAPI contactAPI,
        Widget _,
      ) {
        return FutureBuilder<GlobalContactDatas>(
          future: contactAPI.contacts,
          builder: (
            BuildContext context,
            AsyncSnapshot<GlobalContactDatas> contactSnapshot,
          ) {
            if (contactSnapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (contactSnapshot.hasError) {
              return const Text('ContactAPI error :(');
            } else {
              return builder(
                context,
                contactAPI,
                contactSnapshot.data,
              );
            }
          },
        );
      },
    );
  }
}
