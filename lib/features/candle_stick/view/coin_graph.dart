import 'package:cripto_coins_list/repositories/crypto_coins/models/crypto_coin_details_model.dart';
import 'package:flutter/material.dart';

import '../parts/parts.dart';

class CoinGraph extends StatelessWidget {
  const CoinGraph({super.key, required this.cryptoCoinDetails});

  final CryptoCoinDetailsModel cryptoCoinDetails;

  @override
  Widget build(BuildContext context) {
    List<CandleStickPoint> points = [];
    for (var item in cryptoCoinDetails.list) {
      points.add(CandleStickPoint(
          high: (item.high - cryptoCoinDetails.minLow) /
              cryptoCoinDetails.priceRange,
          low: (item.low - cryptoCoinDetails.minLow) /
              cryptoCoinDetails.priceRange,
          open: (item.open - cryptoCoinDetails.minLow) /
              cryptoCoinDetails.priceRange,
          close: (item.close - cryptoCoinDetails.minLow) /
              cryptoCoinDetails.priceRange));
    }
    return CustomPaint(
        painter: CandleStickPainter(
      points: points,
    ));
  }
}
