import 'package:equatable/equatable.dart';

import 'candle_stick_model.dart';

class CryptoCoinCandleSticks extends Equatable {
  final double minLow;
  final double priceRange;
  final List<CandleStickModel> list;

  const CryptoCoinCandleSticks(
      {required this.minLow, required this.priceRange, required this.list});

  factory CryptoCoinCandleSticks.fromJson(List<dynamic> arrayOfDays) {
    final listMinLowPriceRange = _listCandleStickFromJson(arrayOfDays);
    return CryptoCoinCandleSticks(
        minLow: listMinLowPriceRange.$2,
        priceRange: listMinLowPriceRange.$3,
        list: listMinLowPriceRange.$1);
  }

  static (List<CandleStickModel>, double, double) _listCandleStickFromJson(
      List<dynamic> arrayOfDays) {
    double maxHigh = 0.0;
    double minLow = double.infinity;
    List<CandleStickModel> listOfCandleModels = [];
    for (var item in arrayOfDays) {
      listOfCandleModels.add(CandleStickModel(
          DateTime.fromMillisecondsSinceEpoch(item['time'] * 1000),
          item['high'].toDouble(),
          item['low'].toDouble(),
          item['open'].toDouble(),
          item['close'].toDouble()));
      maxHigh = (item['high'].toDouble() > maxHigh)
          ? item['high'].toDouble()
          : maxHigh;
      minLow =
          (item['low'].toDouble() < minLow) ? item['low'].toDouble() : minLow;
    }
    // listOfCandleModels.removeLast();
    var priceRange = maxHigh - minLow;
    // final coinDetails = CryptoCoinModel(name: name, details: details);
    return (listOfCandleModels, minLow, priceRange);
  }

  @override
  List<Object?> get props => [minLow, priceRange, list];
}
