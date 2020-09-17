import 'package:firebase_auth/firebase_auth.dart';

class Result {
  Result({
    this.success,
    this.message,
    this.credential,
  });

  bool success;
  String message;
  UserCredential credential;
}
