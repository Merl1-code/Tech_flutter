import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:Tech_flutter/screens/register/register.dart';
import 'package:Tech_flutter/screens/login/login.dart';
import 'package:Tech_flutter/components/buttons/all.dart';
import 'package:Tech_flutter/components/screen.dart';
import 'package:Tech_flutter/theme.dart' as theme;

class Landing extends StatefulWidget {
  @override
  LandingState createState() {
    return LandingState();
  }
}

class LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    return Screen(
      backgroundColor: theme.colors.background,
      body: Container(
        padding: theme.spacings.bodyPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 30.0),
            SvgPicture.asset(
              'assets/images/illustration_landing.svg',
              height: 250,
              width: double.infinity,
            ),
            const SizedBox(height: 30.0),
            FittedBox(
              child: Text(
                'Friend Reminder',
                style: theme.texts.title,
              ),
            ),
            const SizedBox(height: 40.0),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 30.0,
              ),
              child: Column(
                children: <Widget>[
                  PrimaryButton(
                    text: 'Sign in',
                    onPressed: () {
                      Navigator.push<MaterialPageRoute<dynamic>>(
                        context,
                        MaterialPageRoute<MaterialPageRoute<dynamic>>(
                            builder: (BuildContext context) => Login()),
                      );
                    },
                  ),
                  const SizedBox(height: 30.0),
                  SecondaryButton(
                    text: 'Sign up',
                    onPressed: () {
                      Navigator.push<MaterialPageRoute<dynamic>>(
                        context,
                        MaterialPageRoute<MaterialPageRoute<dynamic>>(
                            builder: (BuildContext context) => Register()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
