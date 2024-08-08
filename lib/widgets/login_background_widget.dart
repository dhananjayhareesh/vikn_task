import 'package:flutter/material.dart';

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    paint.color = Colors.cyan[300]!;
    canvas.drawCircle(Offset(size.width * 0.9, size.height * 0.4), 100, paint);

    paint.color = Colors.yellow[400]!;
    canvas.drawCircle(Offset(size.width * 0.1, size.height * 0.26), 100, paint);

    paint.color = Colors.pink[200]!;
    canvas.drawCircle(Offset(size.width * 0.3, size.height * 0.9), 100, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
