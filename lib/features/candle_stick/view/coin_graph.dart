import 'package:crypto_coins_list/repositories/crypto_coins/models/crypto_coin_candle_sticks.dart';
import 'package:flutter/material.dart';

import '../parts/parts.dart';

class CoinGraph extends StatelessWidget {
  const CoinGraph({super.key, required this.candleSticks});

  final CryptoCoinCandleSticks candleSticks;

  @override
  Widget build(BuildContext context) {
    List<CandleStickPoint> points = [];
    for (var item in candleSticks.list) {
      points.add(CandleStickPoint(
          high: (item.high - candleSticks.minLow) / candleSticks.priceRange,
          low: (item.low - candleSticks.minLow) / candleSticks.priceRange,
          open: (item.open - candleSticks.minLow) / candleSticks.priceRange,
          close: (item.close - candleSticks.minLow) / candleSticks.priceRange));
    }
    return CustomPaint(
        painter: CandleStickPainter(
      points: points,
    ));
  }
}
