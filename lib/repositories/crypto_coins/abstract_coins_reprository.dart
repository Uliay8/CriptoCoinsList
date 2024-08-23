import 'package:cripto_coins_list/repositories/crypto_coins/models/crypto_coin_details_model.dart';
import 'package:cripto_coins_list/repositories/crypto_coins/models/crypto_coin_model.dart';

abstract class AbstractCoinsReprository {
  Future<List<CryptoCoinModel>> getCoinsList();
  Future<CryptoCoinDetailsModel> getCoinDetails(String name, String imageUrl);
}
