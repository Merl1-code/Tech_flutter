import 'package:flutter/material.dart';
import 'package:Tech_flutter/components/contacts/avatar.dart';
import 'package:Tech_flutter/components/contacts/badge.dart';
import 'package:Tech_flutter/theme.dart' as theme;

class Home extends StatelessWidget {
  const Home();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: theme.spacings.bodyPadding,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Bests',
              style: theme.texts.subtitle,
            ),
            const SizedBox(height: 13),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const <Widget>[
                Avatar(),
                Avatar(),
                Avatar(),
              ],
            ),
            const SizedBox(height: 21),
            Text(
              'Badges',
              style: theme.texts.subtitle,
            ),
            const SizedBox(height: 13),
            Badge(),
            const SizedBox(height: 21),
            Badge(),
            const SizedBox(height: 21),
            Badge(),
          ]),
    );
  }
}
