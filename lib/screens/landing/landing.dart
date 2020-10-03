import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:Tech_flutter/screens/register/register.dart';
import 'package:Tech_flutter/screens/login/login.dart';
import 'package:Tech_flutter/components/buttons/all.dart';

class Landing extends StatefulWidget {
  @override
  LandingState createState() {
    return LandingState();
  }
}

class LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE6DAF9),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(
              horizontal: 50.0,
              vertical: 30.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 30.0),
                Container(
                  height: 250,
                  width: double.infinity,
                  child: SvgPicture.asset(
                    'assets/images/illustration_landing.svg',
                  ),
                ),
                const SizedBox(height: 40.0),
                const FittedBox(
                  child: Text(
                    'Friend Reminder',
                    style: TextStyle(
                        fontFamily: 'Adlery Pro',
                        fontSize: 65,
                        color: Color(0xFFB283FC)),
                  ),
                ),
                const SizedBox(height: 60.0),
                MainButton(
                  text: 'Sign in',
                  onPressed: () {
                    Navigator.push<MaterialPageRoute>(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Login()),
                    );
                  },
                ),
                const SizedBox(height: 25.0),
                SecondaryButton(
                  text: 'Sign up',
                  onPressed: () {
                    Navigator.push<MaterialPageRoute>(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Register()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
