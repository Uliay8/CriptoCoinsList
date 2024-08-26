import 'package:crypto_coins_list/repositories/crypto_coins/models/candle_stick_model.dart';
import 'package:equatable/equatable.dart';

class CryptoCoinDetailsModel extends Equatable {
  final String name;
  final String imageURL;
  final double minLow;
  final double priceRange;
  final List<CandleStickModel> list;

  const CryptoCoinDetailsModel(
      this.name, this.imageURL, this.minLow, this.priceRange, this.list);

  @override
  List<Object?> get props => [name, imageURL, minLow, priceRange, list];
}
