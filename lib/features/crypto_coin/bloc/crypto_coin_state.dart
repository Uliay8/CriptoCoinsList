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
  final CryptoCoinDetailsModel coinDetails;
  @override
  List<Object?> get props => [coinDetails];

  CryptoCoinLoaded({required this.coinDetails});
}

class CryptoCoinLoadingFailure extends CryptoCoinState {
  final Object? exception;

  @override
  List<Object?> get props => [exception];

  CryptoCoinLoadingFailure({required this.exception});
}
