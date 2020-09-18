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
                horizontal: 40.0,
                vertical: 80.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget> [
                  const SizedBox(height: 50.0),
                  Container(
                    height: 250,
                    width: double.infinity,
                    child: SvgPicture.asset('assets/images/illustration_landing.svg',),
                  ),
                  const SizedBox(height: 20.0),
                  const Text('Friend Reminder',
                    style: TextStyle(fontFamily: 'Adlery Pro', fontSize: 65, color: Color(0xFFB283FC)),
                  ),
                  const SizedBox(height: 80.0),
                  Container(
                    width: 300.0,
                    height: 60.0,
                    child: RaisedButton(

                      elevation: 5.0,
                      padding: const EdgeInsets.all(15.0),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                      onPressed: () {
                      },
                      child: const Text('Login', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),),
                      color: const Color(0xFFB283FC),
                    ),
                  ),
                  const SizedBox(height: 25.0),
                  Container(
                    width: 300.0,
                    height: 60.0,
                    child: RaisedButton(
                      elevation: 5.0,
                      padding: const EdgeInsets.all(15.0),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                      onPressed: () {
                      },
                      child: const Text('Signup', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),),
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
