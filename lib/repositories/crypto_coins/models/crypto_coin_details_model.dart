import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'crypto_coin_details_model.g.dart';

@JsonSerializable()
class CryptoCoinDetailsModel extends Equatable {
  @JsonKey(name: 'PRICE')
  final double priceUSD;
  @JsonKey(name: 'IMAGEURL')
  final String imageURL;
  String get fullImageUrl => "https://www.cryptocompare.com/$imageURL";

  // late double minLow;
  // late double priceRange;
  // @JsonKey(toJson: _listCandleStickToJson, fromJson: _listCandleStickFromJson)
  // late List<CandleStickModel> list;

  const CryptoCoinDetailsModel(
      {required this.priceUSD, required this.imageURL});

  factory CryptoCoinDetailsModel.fromJson(Map<String, dynamic> json) {
    return _$CryptoCoinDetailsModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CryptoCoinDetailsModelToJson(this);

  // static int _listCandleStickToJson(List<CandleStickModel> time) =>
  //     throw UnimplementedError();

  // void _getSomeValues(List<dynamic> arrayOfDays) {
  //   final listMinLowPriceRange = _listCandleStickFromJson(arrayOfDays);
  //   list = listMinLowPriceRange.$1;
  //   minLow = listMinLowPriceRange.$2;
  //   priceRange = listMinLowPriceRange.$3;
  // }

  // static (List<CandleStickModel>, double, double) _listCandleStickFromJson(
  //     List<dynamic> arrayOfDays) {
  //   double maxHigh = 0.0;
  //   double minLow = double.infinity;
  //   List<CandleStickModel> listOfCandleModels = [];
  //   for (var item in arrayOfDays) {
  //     listOfCandleModels.add(CandleStickModel(
  //         DateTime.fromMillisecondsSinceEpoch(item['time'] * 1000),
  //         item['high'].toDouble(),
  //         item['low'].toDouble(),
  //         item['open'].toDouble(),
  //         item['close'].toDouble()));
  //     maxHigh = (item['high'].toDouble() > maxHigh)
  //         ? item['high'].toDouble()
  //         : maxHigh;
  //     minLow =
  //         (item['low'].toDouble() < minLow) ? item['low'].toDouble() : minLow;
  //   }
  //   // listOfCandleModels.removeLast();
  //   var priceRange = maxHigh - minLow;
  //   // final coinDetails = CryptoCoinModel(name: name, details: details);
  //   return (listOfCandleModels, minLow, priceRange);
  // }

  @override
  List<Object?> get props => [priceUSD, imageURL];
}
