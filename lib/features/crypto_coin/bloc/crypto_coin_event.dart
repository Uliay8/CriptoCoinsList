part of 'crypto_coin_bloc.dart';

abstract class CryptoCoinEvent extends Equatable {}

class LoadCryptoCoin extends CryptoCoinEvent {
  final Completer? completer;
  final String nameCoin;
  final String imageURL;

  LoadCryptoCoin(
      {required this.nameCoin, required this.imageURL, this.completer});
  @override
  List<Object?> get props => [nameCoin, imageURL, completer];
}
