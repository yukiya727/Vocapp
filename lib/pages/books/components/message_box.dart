import 'dart:typed_data';

import 'package:flutter/material.dart';

class customStyleArrow extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 1
      ..style = PaintingStyle.fill;
    final double triangleH = 10;
    final double triangleW = 20.0;
    final double width = size.width;
    final double height = size.height;

    final Path trianglePath = Path()
      ..moveTo(width / 2 - triangleW / 2, height)
      ..lineTo(width / 2, triangleH + height)
      ..lineTo(width / 2 + triangleW / 2, height)
      ..lineTo(width / 2 - triangleW / 2, height);


    final BorderRadius borderRadius = BorderRadius.circular(15);
    final Rect rect = Rect.fromLTRB(0, 0, width, height);
    final Rect rectShadow = Rect.fromLTRB(-3, -2.5, width+3, height+2.5);
    final RRect outer = borderRadius.toRRect(rect);
    final RRect outerShadow = BorderRadius.circular(20).toRRect(rectShadow);
    final Path outerPath = Path()..addRRect(outer);
    final Path outerShadowPath = Path()..addRRect(outerShadow);


    canvas.drawShadow(trianglePath.shift(Offset(0, 2.5)), Colors.black, 2.0, true);
    canvas.drawShadow(outerShadowPath, Colors.black, 3, true);
    canvas.drawPath(trianglePath, paint);
    canvas.drawRRect(outer, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}