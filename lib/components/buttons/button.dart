import 'package:flutter/material.dart';

enum int { main, secondary }

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
      height: 50,
      child: RaisedButton(
        elevation: 0,
        padding: const EdgeInsets.all(15.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            height: 1,
          ),
        ),
        color: backgroundColor,
      ),
    );
  }
}
