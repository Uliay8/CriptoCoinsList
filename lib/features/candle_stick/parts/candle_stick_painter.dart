import 'package:flutter/material.dart';
import 'candle_stick_point.dart';

class CandleStickPainter extends CustomPainter {
  final Iterable<CandleStickPoint> points;

  CandleStickPainter({
    super.repaint,
    required this.points,
  });

  final bearishPaint = Paint()
    ..color = Colors.red
    ..style = PaintingStyle.fill;
  final bullishPaint = Paint()
    ..color = Colors.green
    ..style = PaintingStyle.fill;
  // final rectPaint = Paint()
  //   ..color = Colors.white24
  //   ..style = PaintingStyle.stroke
  //   ..strokeWidth = 3
  //   ..strokeJoin = StrokeJoin.miter;

  @override
  void paint(Canvas canvas, Size size) {
    final offsetWidth = size.width / (points.length + 1);
    final graphHeight = size.height - offsetWidth;

    var centerX = offsetWidth;
    for (var point in points) {
      double centerY;
      double height;
      Paint candlePaint;
      if (point.close >= point.open) {
        candlePaint = bullishPaint;

        centerY = (point.close - point.open) * 0.5 + point.open;
        height = (point.close - point.open) * graphHeight;
        if (point.close == point.open) {
          centerY = point.open;
          height = 0.5;
        }
      } else {
        candlePaint = bearishPaint;
        centerY = (point.open - point.close) * 0.5 + point.close;
        height = (point.open - point.close) * graphHeight;
      }
      var myRect = Rect.fromCenter(
          center: Offset(
              centerX, size.height - centerY * graphHeight - offsetWidth * 0.5),
          width: offsetWidth * 0.75,
          height: height);
      canvas.drawRect(myRect, candlePaint);
      canvas.drawLine(
          Offset(centerX,
              size.height - offsetWidth * 0.5 - point.high * graphHeight),
          Offset(centerX,
              size.height - offsetWidth * 0.5 - point.low * graphHeight),
          candlePaint);
      centerX += offsetWidth;
    }
  }

  @override
  bool shouldRepaint(covariant CandleStickPainter oldDelegate) {
    return (points != oldDelegate.points);
  }
}
