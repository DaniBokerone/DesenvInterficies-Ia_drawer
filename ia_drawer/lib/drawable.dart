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
  final Color? intColor;
  final List<Color>? intGradient;
  final double borderWidth;

  Rectangle({
    required this.topLeft,
    required this.bottomRight,
    this.contColor = Colors.black,
    this.intColor,
    this.intGradient,
    this.borderWidth = 2.0,
  });

  @override
  void draw(Canvas canvas) {
    final rect = Rect.fromPoints(topLeft, bottomRight);

    final paintFill = Paint()..style = PaintingStyle.fill;
    if (intGradient != null && intGradient!.length >= 2) {
      paintFill.shader = LinearGradient(
        colors: intGradient!,
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(rect);
    } else {
      paintFill.color = intColor ?? Colors.transparent;
    }

    // Borde
    final paintBorder = Paint()
      ..color = contColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    canvas.drawRect(rect, paintFill);
    canvas.drawRect(rect, paintBorder);
  }
}

class Circle extends Drawable {
  final Offset center;
  final double radius;
  final Color contColor;
  final Color? intColor;
  final List<Color>? intGradient;
  final double borderWidth;

  Circle({
    required this.center,
    required this.radius,
    this.contColor = Colors.black,
    this.intColor,
    this.intGradient,
    this.borderWidth = 2.0,
  });

  @override
  void draw(Canvas canvas) {
    final circleRect = Rect.fromCircle(center: center, radius: radius);

    // Relleno
    final paintFill = Paint()..style = PaintingStyle.fill;
    if (intGradient != null && intGradient!.length >= 2) {
      paintFill.shader = RadialGradient(
        colors: intGradient!,
      ).createShader(circleRect);
    } else {
      paintFill.color = intColor ?? Colors.transparent;
    }

    // Borde
    final paintBorder = Paint()
      ..color = contColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

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
