import 'package:flutter/material.dart';
import 'package:Tech_flutter/Firebase/components/useFirebase.dart';
import 'package:Tech_flutter/Firebase/components/authOnly.dart';
import 'screens/Login/login.dart';
import 'package:Tech_flutter/Firebase/utils/register.dart';
import 'package:Tech_flutter/Firebase/utils/login.dart';

void main() {
  runApp(App());
}

void asyncAuthTest() async {
  // final res = await createUserWithEmailAndPassword(
  //     email: 'pierre2.martin@epitech.eu', password: 'Pass_Mwa_L_Beur');
  final res = await signInUserWithEmailAndPassword(
      email: 'pierre2.martin@epitech.eu', password: 'Pass_Mwa_L_Beur');
  print(res.message);
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
      home: UseFirebase(
        loading: const Text('loading...'),
        error: const Text('firebase error'),
        success: Builder(
          builder: (BuildContext context) {
            asyncAuthTest();

            return AuthOnly(
              child: Login(),
              redirect: const Text('Not logged'),
            );
          },
        ),
      ),
    );
  }
}
