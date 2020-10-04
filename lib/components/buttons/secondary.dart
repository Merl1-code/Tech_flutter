import 'package:flutter/painting.dart';

import 'package:flutter/material.dart';
import 'button.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({this.text, this.onPressed});

  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = Theme.of(context).colorScheme.secondary;

    return Button(
      text: text,
      onPressed: onPressed,
      backgroundColor: backgroundColor,
    );
  }
}
