import 'package:flutter/material.dart';

const Color primaryColor = Color(0xFFB283FC); //strong purple
const Color secondaryColor = Color(0xFFC2AEE2); //light purple
const Color backgroundColor = Color(0xFFE6DAF9);

@immutable
class Colors {
  final Color primary = primaryColor;
  final Color secondary = secondaryColor;
  final Color background = backgroundColor;
}

@immutable
class Texts {
  final TextStyle title = const TextStyle(
    fontSize: 65,
    fontFamily: 'Adlery Pro',
    color: primaryColor,
  );
}
