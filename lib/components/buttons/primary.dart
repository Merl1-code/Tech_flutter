import 'package:flutter/painting.dart';

import 'package:flutter/material.dart';
import 'button.dart';

class MainButton extends StatelessWidget {
  const MainButton({this.text, this.onPressed});

  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = Theme.of(context).colorScheme.primary;

    return Button(
      text: text,
      onPressed: onPressed,
      backgroundColor: backgroundColor,
    );
  }
}
