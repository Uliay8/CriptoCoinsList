part of 'crypto_list_bloc.dart';

abstract class CryptoListState extends Equatable {}

class CryptoListInitial extends CryptoListState {
  @override
  List<Object?> get props => [];
}

class CryptoListLoading extends CryptoListState {
  @override
  List<Object?> get props => [];
}

class CryptoListLoaded extends CryptoListState {
  final List<CryptoCoinModel> coinsList;
  @override
  List<Object?> get props => [coinsList];

  CryptoListLoaded({required this.coinsList});
}

class CryptoListLoadingFailure extends CryptoListState {
  final Object? exception;
  @override
  List<Object?> get props => [exception];

  CryptoListLoadingFailure(this.exception);
}
