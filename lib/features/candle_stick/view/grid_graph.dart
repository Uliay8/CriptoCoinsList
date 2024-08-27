import 'package:crypto_coins_list/features/candle_stick/parts/grid_painter.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/models/crypto_coin_candle_sticks.dart';
import 'package:flutter/material.dart';

class GridGraph extends StatelessWidget {
  final CryptoCoinCandleSticks candleSticks;

  const GridGraph({super.key, required this.candleSticks});

  @override
  Widget build(BuildContext context) {
    List<String> listPrices = [];
    final lowRange = candleSticks.minLow;
    final tileRange = candleSticks.priceRange / 5;
    for (var i = 0; i <= 5; i++) {
      listPrices.add((lowRange + i * tileRange).toStringAsFixed(2));
    }
    listPrices = listPrices.reversed.toList();

    List<String> listDates = [];
    final dateRange = candleSticks.list.length ~/ 4;
    for (var i = 0; i < candleSticks.list.length; i += dateRange) {
      var date = candleSticks.list[i].date;
      var dateYear = date.year.toString().substring(2);
      var dateString = "${date.day}.${date.month}.$dateYear";
      listDates.add(dateString);
    }

    return CustomPaint(
        painter:
            GridPainter(listTilePrices: listPrices, listTileDates: listDates));
  }
}
