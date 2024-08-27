import 'package:crypto_coins_list/repositories/crypto_coins/models/crypto_coin_candle_sticks.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/models/crypto_coin_details_model.dart';
import 'package:equatable/equatable.dart';

class CryptoCoinModel extends Equatable {
  final String name;
  final CryptoCoinDetailsModel details;
  final CryptoCoinCandleSticks? candleSticks;

  const CryptoCoinModel(
      {required this.name, required this.details, required this.candleSticks});

  @override
  List<Object?> get props => [name, details, candleSticks];
}
