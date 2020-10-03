import 'package:flutter/material.dart';

const double HEIGHT = 50;
const double ELEVATION = 0;
const double PADDING = 15;
const double BORDER_RADIUS = 50;

const double FONT_SIZE = 18;
const FontWeight FONT_WEIGHT = FontWeight.bold;
const double TEXT_HEIGHT = 1;

class Button extends StatelessWidget {
  const Button(
      {@required this.text,
      @required this.onPressed,
      @required this.textColor,
      @required this.backgroundColor});

  final String text;
  final void Function() onPressed;
  final Color textColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: HEIGHT,
      child: RaisedButton(
        elevation: ELEVATION,
        padding: const EdgeInsets.all(PADDING),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(BORDER_RADIUS)),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: FONT_SIZE,
            fontWeight: FONT_WEIGHT,
            height: TEXT_HEIGHT,
          ),
        ),
        color: backgroundColor,
      ),
    );
  }
}
