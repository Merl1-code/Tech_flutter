import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthOnly extends StatelessWidget {
  const AuthOnly({
    this.child,
    this.redirect,
  });

  final Widget child;
  final Widget redirect;

  @override
  Widget build(BuildContext context) {
    final User user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      return redirect;
    }
    return child;
  }
}
