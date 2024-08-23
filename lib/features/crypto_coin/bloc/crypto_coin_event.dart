part of 'crypto_coin_bloc.dart';

abstract class CryptoCoinEvent extends Equatable {}

class LoadCryptoCoin extends CryptoCoinEvent {
  final String nameCoin;
  final String imageURL;

  LoadCryptoCoin({required this.nameCoin, required this.imageURL});
  @override
  List<Object?> get props => [nameCoin, imageURL];
}
