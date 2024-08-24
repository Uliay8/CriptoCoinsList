import 'package:crypto_coins_list/repositories/crypto_coins/abstract_coins_reprository.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/models/crypto_coin_details_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'crypto_coin_event.dart';
part 'crypto_coin_state.dart';

class CryptoCoinBloc extends Bloc<CryptoCoinEvent, CryptoCoinState> {
  CryptoCoinBloc(this.coinsReprository) : super(CryptoCoinInitial()) {
    on<LoadCryptoCoin>((event, emit) async {
      try {
        if (state is! CryptoCoinLoaded) {
          emit(CryptoCoinLoading());
        }
        final cryptoCoinDetails = await coinsReprository.getCoinDetails(
            event.nameCoin, event.imageURL);
        emit(CryptoCoinLoaded(coinDetails: cryptoCoinDetails));
      } catch (e, st) {
        emit(CryptoCoinLoadingFailure(exception: e));
        GetIt.I<Talker>().handle(e, st);
      }
    });
  }
  final AbstractCoinsReprository coinsReprository;
  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    GetIt.I<Talker>().handle(error, stackTrace);
  }
}
