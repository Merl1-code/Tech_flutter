import 'package:flutter/material.dart';
import 'package:Tech_flutter/theme.dart' as theme;

class Avatar extends StatelessWidget {
  const Avatar({this.size = 100, this.borderSize = 3});

  final double size;
  final double borderSize;

  @override
  Widget build(BuildContext context) {
    final Widget time = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          '35',
          style: theme.texts.avatarBold,
        ),
        Text(
          'h',
          style: theme.texts.avatar,
        ),
        Text(
          '35',
          style: theme.texts.avatarBold,
        ),
        Text(
          'min',
          style: theme.texts.avatar,
        ),
      ],
    );

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
                    color: theme.colors.background,
                    width: borderSize,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          time,
        ],
      ),
    );
  }
}
