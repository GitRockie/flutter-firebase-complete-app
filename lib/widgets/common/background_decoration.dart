import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/themes/app_colors.dart';

class BackgrounDecoration extends StatelessWidget {
  final Widget chid;
  final bool showGradient;
  const BackgrounDecoration(
      {super.key, required this.chid, this.showGradient = false});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
            child: Container(
          decoration: BoxDecoration(
              color: showGradient ? null : Theme.of(context).primaryColor,
              gradient: showGradient ? mainGradient() : null),
          child: CustomPaint(
            painter: BackgroundPainter(),
          ),
        )),
        Positioned(child: chid),
      ],
    );
  }
}

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.white.withOpacity(0.1);

    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width * 0.3, 0);
    path.lineTo(0, size.height * 0.4);
    path.close();

    final path1 = Path();

    path1.moveTo(size.width, 0);
    path1.lineTo(size.width * 0.8, 0);
    path1.lineTo(size.width * 0.2, size.height);
    path1.lineTo(size.width, size.height);
    path1.close();

    //Drawing the path which we've set above
    canvas.drawPath(path, paint);
    canvas.drawPath(path1, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
