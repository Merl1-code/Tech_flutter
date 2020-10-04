import 'package:flutter/material.dart';

const double ELEVATION = 0;
const double PADDING = 15;
const double BORDER_RADIUS = 50;

class Button extends StatelessWidget {
  const Button(
      {@required this.text,
      @required this.onPressed,
      @required this.backgroundColor});

  final String text;
  final void Function() onPressed;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        elevation: ELEVATION,
        padding: const EdgeInsets.all(PADDING),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(BORDER_RADIUS)),
        onPressed: onPressed,
        child: Text(text, style: Theme.of(context).textTheme.button),
        color: backgroundColor,
      ),
    );
  }
}
