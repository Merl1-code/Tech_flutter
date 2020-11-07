import 'package:firebase_auth/firebase_auth.dart';

Future<String> updatePassword(String password) async {
  final User user = FirebaseAuth.instance.currentUser;

  user.updatePassword(password).then((_) {
    return 'Succesfull changed password';
  }).catchError((dynamic error) {
    return 'Password can\'t be changed' + error.toString();
  });
  return '';
}

Future<String> updateEmail(String email) async {
  final User user = FirebaseAuth.instance.currentUser;

  user.updateEmail(email).then((_) {
    return 'Successfully changed email';
  }).catchError((dynamic error) {
    return 'Email can\'t be changed' + error.toString();
  });
  return '';
}
