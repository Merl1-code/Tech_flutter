import 'package:firebase_auth/firebase_auth.dart';
import 'credentialResult.dart';

Future<Result> createUserWithEmailAndPassword(
    {String email, String password}) async {
  final Result res = Result(success: false, message: 'Unknow error');

  try {
    res.credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    res.success = true;
    res.message = 'Successfully register user';
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      res.message = 'The password provided is too weak.';
    } else if (e.code == 'email-already-in-use') {
      res.message = 'The account already exists for that email.';
    } else if (e.code == 'invalid-email') {
      res.message = 'The email provided is invalid.';
    } else {
      res.message = e.code;
    }
  } catch (e) {
    res.message = e.toString();
  }

  return res;
}
