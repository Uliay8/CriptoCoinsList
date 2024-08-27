import 'package:crypto_coins_list/repositories/crypto_coins/models/crypto_coin_model.dart';

abstract class AbstractCoinsReprository {
  Future<List<CryptoCoinModel>> getCoinsList();
  Future<CryptoCoinModel> getCoinDetails(String name);
  Future<List<dynamic>> getDataForCandleStickDetails(String name);
}
