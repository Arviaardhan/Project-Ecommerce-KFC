import 'package:flutter/material.dart';
import 'package:project_ecommerce/helper/themes.dart';
import 'package:project_ecommerce/widgets/utils.dart';
import 'dart:ui' as ui;

class CustomAnimateBorder extends CustomPainter {
  final double animationPercent; // 0.0 to 1.0
  CustomAnimateBorder(this.animationPercent);
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.strokeWidth = 2;
    paint.color = primaryColor;
    paint.style = PaintingStyle.stroke;

    var path = Path();
    path.moveTo(0, size.height / 2);

    path.lineTo(0, 8);
    path.quadraticBezierTo(0, 0, 8, 0);
    path.lineTo(size.width - 8, 0);
    path.quadraticBezierTo(size.width, 0, size.width, 8);
    path.lineTo(size.width, size.height / 2);

    var path2 = Path();
    path2.moveTo(0, size.height / 2);

    path2.lineTo(0, size.height - 8);
    path2.quadraticBezierTo(0, size.height, 8, size.height);
    path2.lineTo(size.width - 8, size.height);
    path2.quadraticBezierTo(
        size.width, size.height, size.width, size.height - 8);
    path2.lineTo(size.width, size.height / 2);

    final p1 = Utils.createAnimatedPath(path, animationPercent);
    final p2 = Utils.createAnimatedPath(path2, animationPercent);

    canvas.drawPath(p1, paint);
    canvas.drawPath(p2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}