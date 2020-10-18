import 'package:flutter/material.dart';
import 'package:Tech_flutter/theme.dart' as theme;

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(13),
      width: double.infinity,
      height: 89,
      color: theme.colors.background,
      child: FittedBox(
        child: Text(
          'Friend Reminder',
          style: theme.texts.title,
        ),
      ),
    );
  }
}
