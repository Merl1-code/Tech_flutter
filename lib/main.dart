import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Tech_flutter/screens/landing/landing.dart';
import 'package:Tech_flutter/firebase/components/use_firebase.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      title: 'Bùlapp',
      theme: ThemeData(
          primaryColor: Colors.blue,
          colorScheme: const ColorScheme(
            primary: Color(0xFFB283FC), //strong purple
            secondary: Color(0xFFC2AEE2), // light purple,
            primaryVariant: Color(0xFFC2AEE2), // unused
            secondaryVariant: Color(0xFFC2AEE2), // unused
            surface: Color(0xFFC2AEE2),
            background: Color(0xFFC2AEE2),
            error: Colors.red,
            onPrimary: Color(0xFFC2AEE2),
            onSecondary: Color(0xFFC2AEE2),
            onSurface: Color(0xFFC2AEE2),
            onBackground: Color(0xFFC2AEE2),
            onError: Color(0xFFCC0000),
            brightness: Brightness.light,
          ),
          textTheme: const TextTheme(
              button: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                height: 1,
              ),
              overline: TextStyle(
                color: Color(0xFFB283FC),
                fontSize: 18,
                fontWeight: FontWeight.normal,
                height: 1,
              ))),
      home: UseFirebase(
        loading: const Text('loading...'),
        error: const Text('firebase error'),
        success: Landing(),
      ),
    );
  }
}
