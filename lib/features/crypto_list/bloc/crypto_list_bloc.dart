// ignore_for_file: avoid_print

import 'dart:async';

import 'package:cripto_coins_list/repositories/crypto_coins/abstract_coins_reprository.dart';
import 'package:cripto_coins_list/repositories/crypto_coins/models/crypto_coin_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'crypto_list_state.dart';
part 'crypto_list_event.dart';

class CryptoListBloc extends Bloc<CryptoListEvent, CryptoListState> {
  final AbstractCoinsReprository coinsReprository;

  CryptoListBloc(this.coinsReprository) : super(CryptoListInitial()) {
    on<LoadCryptoList>((event, emit) async {
      try {
        if (state is! CryptoListLoaded) {
          emit(CryptoListLoading());
        }
        final cryptoCoinsList = await coinsReprository.getCoinsList();
        emit(CryptoListLoaded(coinsList: cryptoCoinsList));
      } catch (e) {
        emit(CryptoListLoadingFailure(e));
      } finally {
        event.completer?.complete();
      }
    });
  }
}
