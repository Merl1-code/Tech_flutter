import 'package:flutter/painting.dart';

import 'package:flutter/material.dart';
import 'button.dart';

class MainButton extends StatelessWidget {
  const MainButton({this.text, this.onPressed});

  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final Color textColor = Colors.white;
    final Color backgroundColor = Colors.black; //Theme.of(context).colors.main;

    return Button(
      text: text,
      onPressed: onPressed,
      textColor: textColor,
      backgroundColor: backgroundColor,
    );
  }
}
