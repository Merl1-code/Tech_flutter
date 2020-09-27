import 'package:flutter/material.dart';
import 'package:Tech_flutter/screens/landing/landing.dart';
import 'package:Tech_flutter/screens/login/login.dart';
import 'package:Tech_flutter/firebase/components/use_firebase.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bùlapp',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Landing(),
      // home: UseFirebase(
      //   loading: const Text('loading...'),
      //   error: const Text('firebase error'),
      //   success: Builder(
      //     builder: (BuildContext context) {
      //       return Landing();
      //     },
      //   ),
      // ),
    );
  }
}
