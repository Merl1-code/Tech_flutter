import 'package:flutter/painting.dart';
import 'package:flutter/material.dart';

import 'package:Tech_flutter/theme.dart' as theme;
import 'button.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({this.text, this.onPressed});

  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    const Color textColor = Colors.white;
    final Color backgroundColor = theme.colors.primary;

    return Button(
      text: text,
      onPressed: onPressed,
      textColor: textColor,
      backgroundColor: backgroundColor,
    );
  }
}
