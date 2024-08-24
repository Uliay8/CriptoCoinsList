import 'package:crypto_coins_list/features/candle_stick/parts/grid_painter.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/models/crypto_coin_details_model.dart';
import 'package:flutter/material.dart';

class GridGraph extends StatelessWidget {
  final CryptoCoinDetailsModel cryptoCoinDetails;

  const GridGraph({super.key, required this.cryptoCoinDetails});

  @override
  Widget build(BuildContext context) {
    List<String> listPrices = [];
    final lowRange = cryptoCoinDetails.minLow;
    final tileRange = cryptoCoinDetails.priceRange / 5;
    for (var i = 0; i <= 5; i++) {
      listPrices.add((lowRange + i * tileRange).toStringAsFixed(2));
    }
    listPrices = listPrices.reversed.toList();

    List<String> listDates = [];
    final dateRange = cryptoCoinDetails.list.length ~/ 4;
    for (var i = 0; i < cryptoCoinDetails.list.length; i += dateRange) {
      var date = cryptoCoinDetails.list[i].date;
      var dateYear = date.year.toString().substring(2);
      var dateString = "${date.day}.${date.month}.$dateYear";
      listDates.add(dateString);
    }

    return CustomPaint(
        painter:
            GridPainter(listTilePrices: listPrices, listTileDates: listDates));
  }
}
