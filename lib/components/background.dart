import 'package:flutter/material.dart';
import 'package:Tech_flutter/components/background.dart';

class Background extends StatelessWidget {
  final Widget child;
  final double size1;
  final double size2;
  const Background({
    Key key,
    @required this.child,
    this.size1,
    this.size2
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      // Here i can use size.width but use double.infinity because both work as a same
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              "assets/images/signup_top.png",
              width: size.width * size1,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              "assets/images/main_bottom.png",
              width: size.width * size2,
            ),
          ),
          child,
        ],
      ),
    );
  }
}