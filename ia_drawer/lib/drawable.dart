import 'package:flutter/material.dart';

abstract class Drawable {
  void draw(Canvas canvas);
}

class Line extends Drawable {
  final Offset start;
  final Offset end;
  final Color contColor;
  final double strokeWidth;

  Line({
    required this.start,
    required this.end,
    this.contColor = Colors.black,
    this.strokeWidth = 2.0,
  });

  @override
  void draw(Canvas canvas) {
    final paint = Paint()
      ..color = contColor
      ..strokeWidth = strokeWidth;
    canvas.drawLine(start, end, paint);
  }
}

class Rectangle extends Drawable {
  final Offset topLeft;
  final Offset bottomRight;
  final Color contColor;
  final Color intColor;

  Rectangle({
    required this.topLeft,
    required this.bottomRight,
    this.contColor = Colors.black,
    this.intColor = Colors.black,
  });

  @override
  void draw(Canvas canvas) {
    //Relleno

    final paintFill = Paint()
      ..color = intColor
      ..style = PaintingStyle.fill;
        
    // Borde mas grande que el relleno
    final paintBorder = Paint()
      ..color = contColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final rect = Rect.fromPoints(topLeft, bottomRight);
    canvas.drawRect(rect, paintFill);
    canvas.drawRect(rect, paintBorder);
  }
}

class Circle extends Drawable {
  final Offset center;
  final double radius;
  final Color contColor;
  final Color intColor;

  Circle({
    required this.center,
    required this.radius,
    this.contColor = Colors.black,
    this.intColor = Colors.black,
  });

  @override
  void draw(Canvas canvas) {
    //Relleno
    final paintFill = Paint()
      ..color = intColor
      ..style = PaintingStyle.fill;

    // Borde mas grande que el relleno
    final paintBorder = Paint()
      ..color = contColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    canvas.drawCircle(center, radius, paintFill);
    canvas.drawCircle(center, radius, paintBorder);
  }
}

class TextElement extends Drawable {
  final String text;
  final Offset position;
  final Color contColor;
  final double fontSize;

  TextElement({
    required this.text,
    required this.position,
    this.contColor = Colors.black,
    this.fontSize = 14.0,
  });

  @override
  void draw(Canvas canvas) {
    final textStyle = TextStyle(
      color: contColor,
      fontSize: fontSize,
    );
    final textSpan = TextSpan(
      text: text,
      style: textStyle,
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(canvas, position);
  }
}
