import 'package:cripto_coins_list/repositories/crypto_coins/abstract_coins_reprository.dart';
import 'package:cripto_coins_list/repositories/crypto_coins/models/candle_stick_model.dart';
import 'package:cripto_coins_list/repositories/crypto_coins/models/crypto_coin_details_model.dart';
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
    return cryptoCoinList;
  }

  @override
  Future<CryptoCoinDetailsModel> getCoinDetails(
      String name, String imageUrl) async {
    final response = await dio.get(
        'https://min-api.cryptocompare.com/data/v2/histoday?fsym=$name&tsym=USD&limit=30');

    var data = response.data as Map<String, dynamic>;
    data = data['Data'] as Map<String, dynamic>;
    final DateTime timeFrom =
        DateTime.fromMillisecondsSinceEpoch(data['TimeFrom'] * 1000);
    final DateTime timeTo =
        DateTime.fromMillisecondsSinceEpoch(data['TimeTo'] * 1000);
    final arrayOfDays = data['Data'] as List<dynamic>;

    double maxHigh = 0.0;
    double minLow = double.infinity;
    List<CandleStickModel> listOfCandleModels = [];
    for (var item in arrayOfDays) {
      listOfCandleModels.add(CandleStickModel(
          DateTime.fromMillisecondsSinceEpoch(item['time'] * 1000),
          item['high'].toDouble(),
          item['low'].toDouble(),
          item['open'].toDouble(),
          item['close'].toDouble()));
      maxHigh = (item['high'].toDouble() > maxHigh)
          ? item['high'].toDouble()
          : maxHigh;
      minLow =
          (item['low'].toDouble() < minLow) ? item['low'].toDouble() : minLow;
    }
    // listOfCandleModels.removeLast();
    var priceRange = maxHigh - minLow;
    final coinDetails = CryptoCoinDetailsModel(name, imageUrl, timeFrom, timeTo,
        minLow, priceRange, listOfCandleModels);
    return coinDetails;
  }
}
