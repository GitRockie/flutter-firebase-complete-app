import 'package:flutter/material.dart';

class BackgrounDecoration extends StatelessWidget {
  final Widget chid;
  final bool showGradient;
  const BackgrounDecoration(
      {super.key, required this.chid, this.showGradient = false});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            child: Container(
          decoration: BoxDecoration(
            color: showGradient ? null : Theme.of(context).primaryColor,
          ),
        ))
      ],
    );
  }
}
