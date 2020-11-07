import 'package:flutter/material.dart';
import 'package:Tech_flutter/components/contacts/avatar.dart';
import 'package:Tech_flutter/components/contacts/badge.dart';
import 'package:Tech_flutter/theme.dart' as theme;
import 'package:Tech_flutter/components/contact_api.dart';

class Home extends StatelessWidget {
  const Home();

  String getMonth(int nb) {
    if (nb == 1)
      return 'January';
    else if (nb == 2)
      return 'February';
    else if (nb == 3)
      return 'March';
    else if (nb == 4)
      return 'April';
    else if (nb == 5)
      return 'May';
    else if (nb == 6)
      return 'June';
    else if (nb == 7)
      return 'July';
    else if (nb == 8)
      return 'August';
    else if (nb == 9)
      return 'September';
    else if (nb == 10)
      return 'October';
    else if (nb == 11)
      return 'November';
    else if (nb == 12) return 'December';
    return nb.toString();
  }

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
                      'You never had pinged a contact :(',
                      style: theme.texts.avatarBold,
                    ),
                    Text(
                      'Ping your first contact to unlock amazing stats !',
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
                    title: 'King of ping',
                    text: 'You have pinged ${data.totalPings} times in total !',
                  ),
                  const SizedBox(height: 21),
                  if (data.lastPing != null)
                    Badge(
                      title: 'The last one',
                      text: 'Your last ping was'
                              ' at ${data.lastPing.hour}h${data.lastPing.minute} the'
                              ' ${data.lastPing.day} ' +
                          getMonth(data.lastPing.month) +
                          ' ${data.lastPing.year}.',
                    ),
                  const SizedBox(height: 21),
                  Badge(
                    title: 'Catch them all',
                    text: 'You have pinged ${data.contactPinged.length}'
                        '${data.contactPinged.length > 1 ? ' different' : ''}'
                        ' contact'
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
