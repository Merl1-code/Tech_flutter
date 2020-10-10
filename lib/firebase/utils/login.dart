import 'package:firebase_auth/firebase_auth.dart';
import 'credential_result.dart';

Future<Result> signInUserWithEmailAndPassword(
    {String email, String password}) async {
  final Result res = Result(success: false, message: 'Unknow error');

  try {
    res.credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    res.success = true;
    res.message = 'Successfully loggin the user';
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      res.message = 'The password provided is too weak.';
    } else if (e.code == 'wrong-password') {
      res.message = 'The account already exists for that email.';
    } else {
      res.message = e.code;
    }
  } catch (e) {
    res.message = e.toString();
  }

  return res;
}

bool userIsAuthenticated() {
  return FirebaseAuth.instance.currentUser != null;
}
