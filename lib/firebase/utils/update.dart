import 'package:firebase_auth/firebase_auth.dart';

Future<void> updatePassword(String password) async {
  final User user = FirebaseAuth.instance.currentUser;

  user.updatePassword(password).then((_) {
    print('Succesfull changed password');
  }).catchError((dynamic error) {
    print('Password can\'t be changed' + error.toString());
  });
}

Future<void> updateEmail(String email) async {
  final User user = FirebaseAuth.instance.currentUser;

  user.updateEmail(email).then((_) {
    print('Succesfull changed email');
  }).catchError((dynamic error) {
    print('Email can\'t be changed' + error.toString());
  });
}
