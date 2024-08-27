import 'package:crypto_coins_list/repositories/crypto_coins/abstract_coins_reprository.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/models/crypto_coin_candle_sticks.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/models/crypto_coin_details_model.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/models/crypto_coin_model.dart';
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
      final details = CryptoCoinDetailsModel.fromJson(dataUsd);
      // final price = dataUsd['PRICE'];
      // final imageUrl = "https://www.cryptocompare.com/${dataUsd['IMAGEURL']}";

      // final dataArrayOfDays = await getDataForCandleStickDetails(e.key);
      // final candleSticks = CryptoCoinCandleSticks.fromJson(dataArrayOfDays);

      return CryptoCoinModel(name: e.key, details: details, candleSticks: null
          // price, imageUrl
          );
    }).toList();
    return cryptoCoinList;
  }

  @override
  Future<CryptoCoinModel> getCoinDetails(String name) async {
    final response = await dio.get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=$name&tsyms=USD');

    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final dataCoin = dataRaw[name] as Map<String, dynamic>;
    final dataUsd = dataCoin['USD'] as Map<String, dynamic>;
    final dataArrayOfDays = await getDataForCandleStickDetails(name);
    final details = CryptoCoinDetailsModel.fromJson(dataUsd);
    final candleSticks = CryptoCoinCandleSticks.fromJson(dataArrayOfDays);
    // / get for coin some data

    return CryptoCoinModel(
        name: name, details: details, candleSticks: candleSticks);
  }

  @override
  Future<List<dynamic>> getDataForCandleStickDetails(String name) async {
    // and another method to get list with candleSticks
    final response = await dio.get(
        'https://min-api.cryptocompare.com/data/v2/histoday?fsym=$name&tsym=USD&limit=30');

    var data = response.data as Map<String, dynamic>;
    data = data['Data'] as Map<String, dynamic>;
    final arrayOfDays = data['Data'] as List<dynamic>;

    return arrayOfDays;

    // final listOfCandleStick = CryptoCoinDetailsModel.fromJson(arrayOfDays);

    // double maxHigh = 0.0;
    // double minLow = double.infinity;
    // List<CandleStickModel> listOfCandleModels = [];
    // for (var item in arrayOfDays) {
    //   listOfCandleModels.add(CandleStickModel(
    //       DateTime.fromMillisecondsSinceEpoch(item['time'] * 1000),
    //       item['high'].toDouble(),
    //       item['low'].toDouble(),
    //       item['open'].toDouble(),
    //       item['close'].toDouble()));
    //   maxHigh = (item['high'].toDouble() > maxHigh)
    //       ? item['high'].toDouble()
    //       : maxHigh;
    //   minLow =
    //       (item['low'].toDouble() < minLow) ? item['low'].toDouble() : minLow;
    // }
    // // listOfCandleModels.removeLast();
    // var priceRange = maxHigh - minLow;
    // final coinDetails = CryptoCoinModel(name: name, details: details);
    // return coinDetails;
  }
}
