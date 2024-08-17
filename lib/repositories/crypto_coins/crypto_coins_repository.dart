import 'package:cripto_coins_list/repositories/crypto_coins/abstract_coins_reprository.dart';
import 'package:cripto_coins_list/repositories/crypto_coins/models/crypto_coin_model.dart';
import 'package:dio/dio.dart';

class CryptoCoinsRepository implements AbstractCoinsReprository {
  final Dio dio;

  CryptoCoinsRepository({required this.dio});

  @override
  Future<List<CryptoCoinModel>> getCoinsList() async {
    final response = await dio.get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,AVAX,USDT,SOL,XRP,TON,TRX,SHIB&tsyms=USD');

    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final cryptoCoinList = dataRaw.entries.map((e) {
      final dataUsd =
          (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
      final price = dataUsd['PRICE'];
      final imageUrl = "https://www.cryptocompare.com/${dataUsd['IMAGEURL']}";
      return CryptoCoinModel(e.key, price, imageUrl);
    }).toList();

    // List<CryptoCoinModel> cryptoCoinList = [];
    // data.entries.forEach((coinMap) => cryptoCoinList.add(CryptoCoinModel(
    //     coinMap.key, (coinMap.value as Map<String, dynamic>)['USD'])));

    return cryptoCoinList;
  }
}
