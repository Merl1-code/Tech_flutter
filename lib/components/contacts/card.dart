import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({this.name, this.photo, this.last, this.onPressed});
  final String name;
  final String photo;
  final String last;
  final void Function() onPressed;

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
            child: CircleAvatar(
              radius: 32,
              backgroundImage: NetworkImage(
                photo,
              ),
              backgroundColor: null,
            ),
          ),
          const SizedBox(
            width: 15,
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
                  const Text(
                    '', //'Last contact :',
                    style: TextStyle(fontSize: 12, color: Color(0xFFC2AEE2)),
                  ),
                  Text(
                    ' ' + last + ' ',
                    style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFFB283FC),
                        fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    '', //'ago',
                    style: TextStyle(fontSize: 12, color: Color(0xFFC2AEE2)),
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
