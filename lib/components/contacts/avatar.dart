import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:Tech_flutter/theme.dart' as theme;

class Avatar extends StatelessWidget {
  const Avatar({
    @required this.lastPing,
    @required this.photo,
    this.initial = '',
    this.size = 100,
    this.borderSize = 3,
    this.borderColor = Colors.blue,
  });

  final DateTime lastPing;
  final Uint8List photo;
  final String initial;
  final double size;
  final double borderSize;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    String pingTime = '${lastPing.day}/${lastPing.month}/${lastPing.year}';
    final DateTime today = DateTime.now();
    if (lastPing.day == today.day &&
        lastPing.month == today.month &&
        lastPing.year == today.year) {
      pingTime = '${lastPing.hour}h${lastPing.minute}';
    }

    return SizedBox(
      height: size,
      width: size,
      child: Column(
        children: <Widget>[
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: MemoryImage(photo)
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(size),
                  ),
                  border: Border.all(
                    color: borderColor,
                    width: borderSize,
                  ),
                ),
                child: photo.isEmpty ? Text(initial) : null,
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            pingTime,
            style: theme.texts.avatarBold,
          ),
        ],
      ),
    );
  }
}
