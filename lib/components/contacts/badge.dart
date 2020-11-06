import 'package:flutter/material.dart';
import 'package:Tech_flutter/theme.dart' as theme;

class Badge extends StatelessWidget {
  const Badge({this.title = 'Title', this.text = 'Text'});
  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 89,
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: theme.colors.background,
        borderRadius: const BorderRadius.all(Radius.circular(21)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(title, style: theme.texts.badgeTitle),
          Text(
            text,
            style: theme.texts.badgeText,
          ),
        ],
      ),
    );
  }
}
