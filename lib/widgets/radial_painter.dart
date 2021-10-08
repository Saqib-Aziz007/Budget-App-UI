import 'dart:math';

import 'package:flutter/cupertino.dart';

class RadialPainter extends CustomPainter {
  RadialPainter({
    required this.baLineColor,
    required this.frLineColor,
    required this.percent,
    required this.width,
  });

  final Color? baLineColor;
  final Color? frLineColor;
  final double percent;
  final double width;
  @override
  void paint(Canvas canvas, Size size) {
    Paint bgLine = Paint()
      ..color = baLineColor!
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;

    Paint frLine = Paint()
      ..color = frLineColor!
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);

    canvas.drawCircle(center, radius, bgLine);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      2 * pi * percent,
      false,
      frLine,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
