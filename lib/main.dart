import 'package:flutter/material.dart';
import 'package:Tech_flutter/Firebase/useFirebase.dart';

import 'screens/Login/login.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Bùlapp",
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: UseFirebase(
        loading: Text("loading..."),
        error: Text("firebase error"),
        success: Login(),
      ),
    );
  }
}
