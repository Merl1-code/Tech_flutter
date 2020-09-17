import 'package:Tech_flutter/components/background.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade50,
      body: Background(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new RotationTransition(
                  turns: new AlwaysStoppedAnimation(15 / 360),
                  child: CircleAvatar(
                    radius: 50,
                    child: Image.network(
                      'https://img.icons8.com/plasticine/2x/idea.png',
                    ),
                    backgroundColor: Colors.purple.shade50,
                  ),
                ),
                Text(
                  "Bù Lâ'pp",
                  style: TextStyle(
                    fontFamily: 'Garineldo2',
                    fontSize: 50,
                  ),
                ),
              ],
            ),
          ),
        ),
        size1: 0.25,
        size2: 0.30,
      ),
    );
  }
}
