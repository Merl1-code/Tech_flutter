import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:Tech_flutter/firebase/utils/login.dart';

class AuthOnly extends StatelessWidget {
  const AuthOnly({
    this.child,
    this.redirectionRoute,
  });

  final Widget child;
  final String redirectionRoute;

  @override
  Widget build(BuildContext context) {
    if (!userIsAuthenticated()) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        Navigator.popAndPushNamed(context, redirectionRoute);
      });
    }
    return child;
  }
}
