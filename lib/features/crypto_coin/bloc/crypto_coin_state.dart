part of 'crypto_coin_bloc.dart';

abstract class CryptoCoinState extends Equatable {}

class CryptoCoinInitial extends CryptoCoinState {
  @override
  List<Object?> get props => [];
}

class CryptoCoinLoading extends CryptoCoinState {
  @override
  List<Object?> get props => [];
}

class CryptoCoinLoaded extends CryptoCoinState {
  final CryptoCoinModel coin;
  @override
  List<Object?> get props => [coin];

  CryptoCoinLoaded({required this.coin});
}

class CryptoCoinLoadingFailure extends CryptoCoinState {
  final Object? exception;

  @override
  List<Object?> get props => [exception];

  CryptoCoinLoadingFailure({required this.exception});
}
