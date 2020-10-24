import 'package:flutter/material.dart';
import 'package:Tech_flutter/firebase/utils/logout.dart';
import 'package:Tech_flutter/theme.dart' as theme;

class Profil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: theme.spacings.bodyPadding,
      child: Center(
        child: Container(
          color: Colors.blue,
          child: FlatButton(
            onPressed: () async {
              await logout();
              Navigator.popUntil(
                context,
                ModalRoute.withName('/'),
              );
            },
            child: const Text('logout'),
          ),
        ),
      ),
    );
  }
}
