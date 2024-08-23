import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class GridPainter extends CustomPainter {
  final List<String> listTilePrices;
  final List<String> listTileDates;

  GridPainter({required this.listTilePrices, required this.listTileDates});

  final rectPaint = Paint()
    ..color = Colors.white12
    ..style = PaintingStyle.stroke
    ..strokeWidth = 1.5
    ..strokeJoin = StrokeJoin.miter;

  @override
  void paint(Canvas canvas, Size size) {
    var rect = Rect.fromLTWH(60, 0, size.width - 60, size.height);
    canvas.drawRect(rect, rectPaint);
    const int horizontalLines = 4;
    const int verticalLines = 3;
    var heightTile = size.height / (horizontalLines + 1);
    var widthLile = (size.width - 60) / (verticalLines + 1);

    var paragraph = createParagraph(listTilePrices[0]);
    canvas.drawParagraph(paragraph, const Offset(0, 0));
    for (var i = 1; i <= horizontalLines; i++) {
      canvas.drawLine(Offset(60, heightTile * i),
          Offset(size.width, heightTile * i), rectPaint);
      final paragraph = createParagraph(listTilePrices[i]);
      canvas.drawParagraph(paragraph, Offset(0, heightTile * i - 6));
    }
    paragraph = createParagraph(listTilePrices[listTilePrices.length - 1]);
    canvas.drawParagraph(paragraph, Offset(0, size.height - 12));

    for (var i = 1; i <= verticalLines; i++) {
      canvas.drawLine(Offset(widthLile * i + 60, 0),
          Offset(widthLile * i + 60, size.height), rectPaint);
      paragraph = createParagraph(listTileDates[i]);
      canvas.drawParagraph(
          paragraph, Offset(widthLile * i + 30, size.height + 6));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  ui.Paragraph createParagraph(String text) {
    ui.ParagraphStyle paragraphStyle = ui.ParagraphStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        textDirection: TextDirection.rtl);
    ui.TextStyle textStyl = ui.TextStyle(color: Colors.white70);
    ui.ParagraphBuilder paragraphBuilder = ui.ParagraphBuilder(paragraphStyle);
    paragraphBuilder.pushStyle(textStyl);
    paragraphBuilder.addText(text);
    ui.Paragraph paragraph = paragraphBuilder.build();
    paragraph.layout(const ui.ParagraphConstraints(width: 52));
    return paragraph;
  }
}
