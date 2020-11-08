import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:Tech_flutter/theme.dart' as theme;

class Avatar extends StatelessWidget {
  const Avatar({
    @required this.lastPing,
    @required this.photo,
    this.initial = '',
    this.size = 35,
    this.borderSize = 3,
    this.borderColor = Colors.blue,
    this.maxSize = 45
  });

  final DateTime lastPing;
  final Uint8List photo;
  final String initial;
  final double size;
  final double borderSize;
  final Color borderColor;
  final double maxSize;

  @override
  Widget build(BuildContext context) {
    String pingTime = '${lastPing.day}/${lastPing.month}/${lastPing.year}';
    final DateTime today = DateTime.now();
    if (lastPing.day == today.day &&
        lastPing.month == today.month &&
        lastPing.year == today.year) {
      pingTime = '${lastPing.hour}h${lastPing.minute}';
    }

    return Column(
       children: <Widget>[
         SizedBox(height: maxSize - (size + borderSize),), //Formule pour aligner les dates par rapport a leur size
      CircleAvatar(
      radius: size + borderSize,
      backgroundColor: borderColor,
      child: (photo.isNotEmpty)
          ? CircleAvatar(
        radius: size,
        backgroundImage: MemoryImage(photo),
        backgroundColor: null,
      )
          : CircleAvatar(
        child: Text(
          initial,
          style: const TextStyle(backgroundColor: null, fontSize: 20),
        ),
        radius: size,
        backgroundColor: const Color(0xFFB283FC),
      ),
    ),
         SizedBox(height: maxSize - (size + borderSize),), //Formule pour aligner les dates par rapport a leur size
         Text(
           pingTime,
           style: theme.texts.avatarBold,
         ),
        ],
    );
  }
}
