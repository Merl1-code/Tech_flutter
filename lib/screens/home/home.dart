import 'package:flutter/material.dart';
import 'package:Tech_flutter/components/contacts/avatar.dart';
import 'package:Tech_flutter/components/contacts/badge.dart';
import 'package:Tech_flutter/theme.dart' as theme;
import 'package:Tech_flutter/components/contact_api.dart';

/**TODO
 * get stats
 * use contacts profile picture
 * change size avatar by rank
 */

class Home extends StatelessWidget {
  const Home();

  List<Widget> _renderAvatars(List<ContactWithPing> contacts) {
    final List<Widget> widgets = <Widget>[];
    const List<int> indexes = <int>[1, 0, 2];
    const List<double> sizes = <double>[100, 80, 80];

    for (final int idx in indexes) {
      if (contacts != null &&
          contacts[idx] != null &&
          contacts[idx].ping != null) {
        widgets.add(
          Avatar(
            lastPing: contacts[idx].ping.lastPing,
            size: sizes[idx],
            borderColor:
                idx == 0 ? theme.colors.primary : theme.colors.background,
          ),
        );
      }
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return ContactAPIProvider(
      builder: (BuildContext context, ContactAPI api, GlobalContactDatas data) {
        return FutureBuilder<List<ContactWithPing>>(
          future: api.getContactsByScore(),
          builder: (
            BuildContext context,
            AsyncSnapshot<List<ContactWithPing>> snapshot,
          ) {
            if (snapshot.hasData && snapshot.data[0].ping == null) {
              return Container(
                padding: const EdgeInsets.all(21),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Vous n\'avez jamais pingué de contact :(',
                      style: theme.texts.avatarBold,
                    ),
                    Text(
                      'Pinguez votre premier contact pour débloquer les statistiques !',
                      textAlign: TextAlign.center,
                      style: theme.texts.avatar,
                    ),
                  ],
                ),
              );
            }

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
                    children: _renderAvatars(snapshot.data),
                  ),
                  const SizedBox(height: 21),
                  Text(
                    'Stats',
                    style: theme.texts.subtitle,
                  ),
                  const SizedBox(height: 13),
                  Badge(
                    title: 'Roi du ping',
                    text: 'Vous avez pingué ${data.totalPings} fois au total !',
                  ),
                  const SizedBox(height: 21),
                  if (data.lastPing != null)
                    Badge(
                      title: 'Dernier en date',
                      text: 'Votre dernier ping était'
                          ' le ${data.lastPing.day}/${data.lastPing.month}'
                          '/${data.lastPing.year}'
                          ' à ${data.lastPing.hour}h${data.lastPing.minute}.',
                    ),
                  const SizedBox(height: 21),
                  Badge(
                    title: 'Catch them all',
                    text: 'vous avez pingué ${data.contactPinged.length}'
                        ' contact'
                        '${data.contactPinged.length > 1 ? 's différents' : ''}'
                        ' !',
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
