import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button(
    this.text, {
    this.textColor = Colors.white,
    this.backgroundColor = Colors.black,
  });

  final String text;
  final Color textColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      elevation: 5.0,
      padding: const EdgeInsets.all(15.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      onPressed: () {},
      child: Text(
        text,
        style: TextStyle(
            color: textColor, fontSize: 24, fontWeight: FontWeight.bold),
      ),
      color: backgroundColor,
    );
  }
}
