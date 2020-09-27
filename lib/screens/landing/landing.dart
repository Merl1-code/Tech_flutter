import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:Tech_flutter/components/button.dart';

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
      body: SafeArea(child: LayoutBuilder(builder: (context, constraints) {
        print(constraints.maxHeight);
        print(constraints.maxWidth);

        return Expanded(
          child: Flex(
            direction: Axis.vertical,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Flexible(
                flex: 4,
                child: SvgPicture.asset(
                  'assets/images/illustration_landing.svg',
                ),
              ),
              Spacer(),
              Flexible(
                flex: 4,
                child: Text(
                  'Friend Reminder',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Adlery Pro',
                      fontSize: 65,
                      color: Color(0xFFB283FC)),
                ),
              ),
              Spacer(),
              Flexible(
                flex: 2,
                child: const Button(
                  'Sign-in',
                  textColor: Colors.white,
                  backgroundColor: Color(0xFFB283FC),
                ),
              ),
              Spacer(),
              Flexible(
                flex: 2,
                child: const Button(
                  'Sign-up',
                  textColor: Colors.white,
                  backgroundColor: Color(0xFFC2AEE2),
                ),
              ),
            ],
          ),
        );
      })),
      // body: Container(
      //   height: double.infinity,
      //   width: double.infinity,
      //   child: SafeArea(
      // child: SingleChildScrollView(
      //   physics: const AlwaysScrollableScrollPhysics(),
      //   padding: const EdgeInsets.symmetric(
      //     horizontal: 10.0,
      //     vertical: 10.0,
      //   ),
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: <Widget>[
      //       Container(
      //         height: 250,
      //         width: double.infinity,
      //         child: SvgPicture.asset(
      //           'assets/images/illustration_landing.svg',
      //         ),
      //       ),
      //       const Text(
      //         'Friend Reminder',
      //         textAlign: TextAlign.center,
      //         style: TextStyle(
      //             fontFamily: 'Adlery Pro',
      //             fontSize: 65,
      //             color: Color(0xFFB283FC)),
      //       ),
      //       const Button(
      //         'Sign-in',
      //         textColor: Colors.white,
      //         backgroundColor: Color(0xFFB283FC),
      //       ),
      //       const Button(
      //         'Sign-up',
      //         textColor: Colors.white,
      //         backgroundColor: Color(0xFFC2AEE2),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
