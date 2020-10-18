import 'package:flutter/material.dart';

const Color primaryColor = Color(0xFFB283FC); //strong purple
const Color secondaryColor = Color(0xFFC2AEE2); //light purple
const Color backgroundColor = Color(0xFFE6DAF9);
const Color whiteColor = Color(0xFFFFFFFF);

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
  final TextStyle subtitle = const TextStyle(
    fontSize: 34,
    color: whiteColor,
    fontWeight: FontWeight.bold,
  );
  final TextStyle badgeTitle = const TextStyle(
    fontSize: 17,
    color: Color(0xff000000),
    fontWeight: FontWeight.bold,
  );
  final TextStyle badgeText = const TextStyle(
    fontSize: 17,
    color: Color(0xff000000),
  );
  final TextStyle avatarBold = const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: whiteColor,
  );
  final TextStyle avatar = const TextStyle(
    fontSize: 15,
    color: whiteColor,
  );
}
