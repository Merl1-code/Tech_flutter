import 'dart:typed_data';

import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({this.name, this.photo, this.last, this.onPressed});
  final String name;
  final Uint8List photo;
  final String last;
  final void Function() onPressed;

  String getMonth(String nb) {
    if (nb == '01')
      return 'January';
    else if (nb == '02')
      return 'February';
    else if (nb == '03')
      return 'March';
    else if (nb == '04')
      return 'April';
    else if (nb == '05')
      return 'May';
    else if (nb == '06')
      return 'June';
    else if (nb == '07')
      return 'July';
    else if (nb == '08')
      return 'August';
    else if (nb == '09')
      return 'September';
    else if (nb == '10')
      return 'October';
    else if (nb == '11')
      return 'November';
    else if (nb == '12') return 'December';
    return nb;
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: const EdgeInsets.all(0.0),
      color: Colors.white,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
          side: BorderSide.none, borderRadius: BorderRadius.circular(50)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 35,
            backgroundColor: const Color(0xFFB283FC),
            child: (photo != null && photo.isNotEmpty)
                ? CircleAvatar(
                    radius: 32,
                    backgroundImage: MemoryImage(photo),
                    backgroundColor: null,
                  )
                : CircleAvatar(
                    child: Text(
                      name[0],
                      style: const TextStyle(backgroundColor: null),
                    ),
                    radius: 32,
                    backgroundColor: null,
                  ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                name,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontSize: 20,
                    color: Color(0xFFB283FC),
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Text>[
                  Text(
                    (last == 'Never being pinged')
                        ? (' ' + last + ' ')
                        : (last.split('-')[2].substring(0, 2) +
                            ' ' +
                            getMonth(last.split('-')[1]) +
                            ' ' +
                            last.split('-')[0]),
                    style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFFB283FC),
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    (last == 'Never being pinged') ? '' : ', pinged ',
                    style:
                        const TextStyle(fontSize: 12, color: Color(0xFFC2AEE2)),
                  ),
                  Text(
                    (last == 'Never being pinged') ? '' : last.split('x')[1],
                    style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFFB283FC),
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    (last == 'Never being pinged')
                        ? ''
                        : (last.split('x')[1] == '1' ? ' time' : ' times'),
                    style:
                        const TextStyle(fontSize: 12, color: Color(0xFFC2AEE2)),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            width: 35,
          ),
        ],
      ),
    );
  }
}
