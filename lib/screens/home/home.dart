import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 800,
      width: 800,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment(0.8, 0.0),
          colors: <Color>[Color(0xffee0000), Color(0xffeeee00)],
          tileMode: TileMode.repeated,
        ),
      ),
    );
  }
}
