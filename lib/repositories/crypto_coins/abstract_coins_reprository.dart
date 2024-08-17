import 'package:cripto_coins_list/repositories/crypto_coins/models/crypto_coin_model.dart';

abstract class AbstractCoinsReprository {
  Future<List<CryptoCoinModel>> getCoinsList();
}
