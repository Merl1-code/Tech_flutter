import 'package:Tech_flutter/firebase/components/auth_only.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Tech_flutter/firebase/components/use_firebase.dart';
import 'package:Tech_flutter/screens/landing/landing.dart';
import 'package:Tech_flutter/screens/login/login.dart';
import 'package:Tech_flutter/screens/register/register.dart';
import 'package:Tech_flutter/screens/home/home.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  final List<DeviceOrientation> orientation = <DeviceOrientation>[
    DeviceOrientation.portraitUp
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(orientation);
    return UseFirebase(
      loading: const Directionality(
        textDirection: TextDirection.ltr,
        child: Text(
          'loading...',
        ),
      ),
      error: const Directionality(
        textDirection: TextDirection.ltr,
        child: Text(
          'Firebase error',
        ),
      ),
      success: MaterialApp(
        title: 'Bùlapp',
        routes: {
          '/': (BuildContext context) => AuthRouting(),
          '/register': (BuildContext context) => Register(),
          '/login': (BuildContext context) => Login(),
        },
      ),
    );
  }
}

class AuthRouting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AuthOnly(
      redirect: Landing(),
      child: const Home(),
    );
  }
}
