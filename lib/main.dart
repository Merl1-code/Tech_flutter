import 'package:Tech_flutter/firebase/components/auth_only.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Tech_flutter/firebase/components/use_firebase.dart';
import 'package:Tech_flutter/components/navscreen.dart' as nav;
import 'package:Tech_flutter/screens/landing/landing.dart';
import 'package:Tech_flutter/screens/login/login.dart';
import 'package:Tech_flutter/screens/register/register.dart';
import 'package:Tech_flutter/screens/home/home.dart';
import 'package:Tech_flutter/screens/profile/profile.dart';
import 'package:Tech_flutter/screens/contact/contact.dart';

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
        initialRoute: '/authenticated',
        routes: <String, Widget Function(BuildContext)>{
          '/': (BuildContext context) => Landing(),
          '/register': (BuildContext context) => Register(),
          '/login': (BuildContext context) => Login(),
          '/authenticated': (BuildContext context) => Auth(),
        },
      ),
    );
  }
}

class Auth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AuthOnly(
      redirectionRoute: '/',
      child: nav.NavScreen(
        initiaRoute: 'home',
        routes: <nav.Route>[
          nav.Route('profil', Profil(), Icons.account_circle_rounded),
          const nav.Route('home', Home(), Icons.home_rounded),
          nav.Route('contact', Contact(), Icons.message_rounded),
        ],
      ),
    );
  }
}
