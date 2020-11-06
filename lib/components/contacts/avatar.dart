import 'package:flutter/material.dart';
import 'package:Tech_flutter/theme.dart' as theme;

class Avatar extends StatelessWidget {
  const Avatar({
    @required this.lastPing,
    this.size = 100,
    this.borderSize = 3,
    this.borderColor = Colors.blue,
  });

  final DateTime lastPing;
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
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      'https://scontent-rtl.akamaized.net/GED/09670000/9677800/9677861_700x0.webp',
                    ),
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(size),
                  ),
                  border: Border.all(
                    color: borderColor,
                    width: borderSize,
                  ),
                ),
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
