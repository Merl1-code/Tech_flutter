import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UseFirebase extends StatelessWidget {
  UseFirebase({
    this.loading,
    this.success,
    this.error,
  });

  final Widget loading;
  final Widget success;
  final Widget error;
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FirebaseApp>(
        future: _initialization,
        builder: (BuildContext context, AsyncSnapshot<FirebaseApp> snapshot) {
          FirebaseFirestore.instance.settings =
              const Settings(persistenceEnabled: false);

          if (snapshot.hasError) {
            print('error');
            return error;
          }

          if (snapshot.connectionState == ConnectionState.done) {
            print('firebase connection success');
            return success;
          }

          print('firebase loading');
          return loading;
        });
  }
}
