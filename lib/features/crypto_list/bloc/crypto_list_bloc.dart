// ignore_for_file: avoid_print

import 'dart:async';

import 'package:crypto_coins_list/repositories/crypto_coins/abstract_coins_reprository.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/models/crypto_coin_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

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
      } catch (e, st) {
        emit(CryptoListLoadingFailure(e));
        GetIt.I<Talker>().handle(e, st);
      } finally {
        event.completer?.complete();
      }
    });
  }
  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    GetIt.I<Talker>().handle(error, stackTrace);
  }
}
