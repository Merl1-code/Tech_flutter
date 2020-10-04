import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//shape
const double PADDING = 16;
const double BORDER_WIDTH = 2;
const double BORDER_RADIUS = 50;

//text
const double TEXT_HEIGHT = 1;
const double FONTSIZE = 16;

class FlatTextField extends StatelessWidget {
  const FlatTextField({
    @required this.controller,
    @required this.keyboardType,
    @required this.textColor,
    @required this.backgroundColor,
    @required this.borderColor,
    @required this.focusColor,
    @required this.hintText,
    @required this.validator,
    this.enabled = true,
    this.obscureText = false,
  });

  final TextEditingController controller;
  final TextInputType keyboardType;

  final Color textColor;
  final Color backgroundColor;
  final Color borderColor;
  final Color focusColor;

  final String hintText;
  final String Function(String) validator;

  final bool enabled;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      obscureText: obscureText,
      controller: controller,
      cursorColor: Colors.white,
      validator: validator,
      keyboardType: keyboardType,
      style: TextStyle(
        color: textColor,
        height: TEXT_HEIGHT,
        fontSize: FONTSIZE,
      ),
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(PADDING),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(BORDER_RADIUS),
            borderSide: BorderSide(
              color: focusColor,
              width: BORDER_WIDTH,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(BORDER_RADIUS),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.onError,
              width: BORDER_WIDTH,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(BORDER_RADIUS),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.error,
              width: BORDER_WIDTH,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(BORDER_RADIUS),
            borderSide: BorderSide.none,
          ),
          fillColor: backgroundColor,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(
            color: textColor,
            height: TEXT_HEIGHT,
            fontSize: FONTSIZE,
          )),
    );
  }
}
