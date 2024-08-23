import 'package:cripto_coins_list/repositories/crypto_coins/abstract_coins_reprository.dart';
import 'package:cripto_coins_list/repositories/crypto_coins/models/crypto_coin_details_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      } on Exception catch (e) {
        emit(CryptoCoinLoadingFailure(exception: e));
      }
    });
  }
  final AbstractCoinsReprository coinsReprository;
}
