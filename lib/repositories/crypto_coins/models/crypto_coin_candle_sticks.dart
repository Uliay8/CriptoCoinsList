import 'package:equatable/equatable.dart';
import 'candle_stick_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'crypto_coin_candle_sticks.g.dart';

@HiveType(typeId: 2)
class CryptoCoinCandleSticks extends Equatable {
  @HiveField(0)
  final double minLow;

  @HiveField(1)
  final double priceRange;

  @HiveField(3)
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
    var priceRange = maxHigh - minLow;
    return (listOfCandleModels, minLow, priceRange);
  }

  @override
  List<Object?> get props => [minLow, priceRange, list];
}
