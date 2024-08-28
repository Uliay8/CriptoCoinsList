import 'package:crypto_coins_list/repositories/crypto_coins/models/crypto_coin_candle_sticks.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/models/crypto_coin_details_model.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'crypto_coin_model.g.dart';

@HiveType(typeId: 4)
class CryptoCoinModel extends Equatable {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final CryptoCoinDetailsModel details;

  @HiveField(2)
  final CryptoCoinCandleSticks? candleSticks;

  const CryptoCoinModel(
      {required this.name, required this.details, required this.candleSticks});

  @override
  List<Object?> get props => [name, details, candleSticks];
}
