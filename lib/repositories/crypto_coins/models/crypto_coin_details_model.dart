import 'package:cripto_coins_list/repositories/crypto_coins/models/candle_stick_model.dart';

class CryptoCoinDetailsModel {
  final String name;
  final String imageURL;
  final DateTime dateFrom;
  final DateTime dateTo;
  final double minLow;
  final double priceRange;
  final List<CandleStickModel> list;

  CryptoCoinDetailsModel(this.name, this.imageURL, this.dateFrom, this.dateTo,
      this.minLow, this.priceRange, this.list);
}
