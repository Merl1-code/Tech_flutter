import 'package:flutter/material.dart';

class Card extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: const EdgeInsets.all(0.0),
      color: Colors.white,
      onPressed: () {},
      shape: RoundedRectangleBorder(
          side: BorderSide.none, borderRadius: BorderRadius.circular(50)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const CircleAvatar(
            radius: 35,
            backgroundColor: Color(0xFFB283FC),
            child: CircleAvatar(
              radius: 32,
              backgroundImage: NetworkImage(
                'https://scontent-rtl.akamaized.net/GED/09670000/9677800/9677861_700x0.webp',
              ),
              backgroundColor: null,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Container(
            constraints: const BoxConstraints(minWidth: 100, maxWidth: 231),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Jean Pierre Pernaut',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
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
                  children: const <Text>[
                    Text(
                      'Last contact :',
                      style: TextStyle(fontSize: 12, color: Color(0xFFC2AEE2)),
                    ),
                    Text(
                      ' 18h ',
                      style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFFB283FC),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'ago',
                      style: TextStyle(fontSize: 12, color: Color(0xFFC2AEE2)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 35,
          ),
        ],
      ),
    );
  }
}
