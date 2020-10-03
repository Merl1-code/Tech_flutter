import 'package:Tech_flutter/screens/Login/login.dart';
import 'package:Tech_flutter/screens/Register/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                children: <Widget> [
                  const SizedBox(height: 30.0),
                  Container(
                    height: 250,
                    width: double.infinity,
                    child: SvgPicture.asset('assets/images/illustration_landing.svg',),
                  ),
                  const SizedBox(height: 40.0),
                  const FittedBox(
                    child: Text('Friend Reminder',
                      style: TextStyle(fontFamily: 'Adlery Pro', fontSize: 65, color: Color(0xFFB283FC)),
                    ),
                  ),
                  const SizedBox(height: 60.0),
                  Container(
                    width: double.infinity,
                    height: 50,
                    child: RaisedButton(
                      elevation: 0,
                      padding: const EdgeInsets.all(15.0),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                      onPressed: () {
                        Navigator.push<MaterialPageRoute>(
                          context,
                          MaterialPageRoute(builder: (BuildContext context) => Login()),
                        );
                      },
                      child: const Text('Login', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold, height: 1),),
                      color: const Color(0xFFB283FC),
                    ),
                  ),
                  const SizedBox(height: 25.0),
                  Container(
                    width: double.infinity,
                    height: 50,
                    child: RaisedButton(
                      elevation: 0,
                      padding: const EdgeInsets.all(15.0),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                      onPressed: () {
                        Navigator.push<MaterialPageRoute>(
                          context,
                          MaterialPageRoute(builder: (BuildContext context) => Register()),
                        );
                      },
                      child: const Text('Sign up', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold, height: 1),),
                      color: const Color(0xFFC2AEE2),
                    ),
                  ),
                ],
              ),
            ),
        ),
      ),
    );
  }
}
