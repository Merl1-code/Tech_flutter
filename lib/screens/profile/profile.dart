import 'package:flutter/material.dart';
import 'package:Tech_flutter/firebase/utils/logout.dart';

class Profil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.blue,
        child: FlatButton(
          onPressed: () async {
            await logout();
            Navigator.popUntil(context, ModalRoute.withName('/'));
          },
          child: Text("logout"),
        ),
      ),
    );
  }
}
