import 'package:flutter/painting.dart';

import 'package:flutter/material.dart';
import 'button.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({this.text, this.onPressed});

  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    const Color textColor = Colors.white;
    const Color backgroundColor =
        Color(0xFFC2AEE2); //Theme.of(context).colors.main;

    return Button(
      text: text,
      onPressed: onPressed,
      textColor: textColor,
      backgroundColor: backgroundColor,
    );
  }
}
