import 'package:flutter/material.dart';

class Dialogues {
  //creating Singleton class inside
  static final _singleton = Dialogues._internal();
  Dialogues._internal();

  factory Dialogues() {
    return _singleton;
  }

  //Creating Widget
  static Widget questionStartDialogue({required VoidCallback onTap}) {
    return AlertDialog(
      content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Hi, there!',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Text('Please, login first!')
          ]),
      actions: [TextButton(onPressed: onTap, child: const Text('Okay'))],
    );
  }
}
