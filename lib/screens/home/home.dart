import 'package:flutter/material.dart';
import 'package:Tech_flutter/components/contacts/avatar.dart';
import 'package:Tech_flutter/components/contacts/badge.dart';
import 'package:Tech_flutter/theme.dart' as theme;
import 'package:Tech_flutter/components/contact_api.dart';

/**TODO
 * use consumer
 * get stats
 * use contacts profile picture
 * change size avatar by rank
 */

class Home extends StatelessWidget {
  const Home();

  @override
  Widget build(BuildContext context) {
    return ContactAPIProvider(
      builder: (BuildContext context, ContactAPI api, GlobalContactDatas data) {
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
                  'Stats',
                  style: theme.texts.subtitle,
                ),
                const SizedBox(height: 13),
                Badge(
                  title: 'Roi du ping',
                  text: 'Vous avez pingé ${data.totalPings} fois au total !',
                ),
                const SizedBox(height: 21),
                Badge(
                    title: 'Dernier en date',
                    text: 'Votre dernier ping était le à'),
                const SizedBox(height: 21),
                Badge(
                    title: 'ce badge n\'est pas rempli',
                    text: 'mais il est la pour faire joli'),
              ]),
        );
      },
    );
  }
}
