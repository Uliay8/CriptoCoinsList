import 'package:crypto_coins_list/repositories/crypto_coins/abstract_coins_reprository.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/models/crypto_coin_candle_sticks.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/models/crypto_coin_details_model.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/models/crypto_coin_model.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:talker_flutter/talker_flutter.dart';

class CryptoCoinsRepository implements AbstractCoinsReprository {
  final Dio dio;
  final Box<CryptoCoinModel> cryptoCoinsBox;

  CryptoCoinsRepository({required this.dio, required this.cryptoCoinsBox});

  @override
  Future<List<CryptoCoinModel>> getCoinsList() async {
    var cryptoCoinList = <CryptoCoinModel>[];
    try {
      cryptoCoinList = await _fetchCoinsListFromApi();
      final cryptoCoinsMap = {for (var e in cryptoCoinList) e.name: e};
      await cryptoCoinsBox.putAll(cryptoCoinsMap);
    } catch (e, st) {
      GetIt.I<Talker>().handle(e, st);
      cryptoCoinList = cryptoCoinsBox.values.toList();
    }
    cryptoCoinList
        .sort((a, b) => b.details.priceUSD.compareTo(a.details.priceUSD));
    return cryptoCoinList;
  }

  Future<List<CryptoCoinModel>> _fetchCoinsListFromApi() async {
    final response = await dio.get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,AVAX,USDT,SOL,XRP,TON,TRX,SHIB&tsyms=USD');
    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final cryptoCoinList = dataRaw.entries.map((e) {
      final dataUsd =
          (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
      final details = CryptoCoinDetailsModel.fromJson(dataUsd);
      return CryptoCoinModel(name: e.key, details: details, candleSticks: null);
    }).toList();
    return cryptoCoinList;
  }

  @override
  Future<CryptoCoinModel> getCoinDetails(String name) async {
    try {
      final coin = await _fetchCoinDetailsFromApi(name);
      cryptoCoinsBox.put(name, coin);
      return coin;
    } catch (e, st) {
      GetIt.I<Talker>().handle(e, st);
      if (cryptoCoinsBox.containsKey(name) &&
          cryptoCoinsBox.get(name)?.candleSticks != null) {
        return cryptoCoinsBox.get(name)!;
      }
      throw Exception("There is no way to download the data");
    }
  }

  Future<CryptoCoinModel> _fetchCoinDetailsFromApi(String name) async {
    final response = await dio.get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=$name&tsyms=USD');

    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final dataCoin = dataRaw[name] as Map<String, dynamic>;
    final dataUsd = dataCoin['USD'] as Map<String, dynamic>;
    final dataArrayOfDays = await getDataForCandleStickDetails(name);
    final details = CryptoCoinDetailsModel.fromJson(dataUsd);
    final candleSticks = CryptoCoinCandleSticks.fromJson(dataArrayOfDays);
    return CryptoCoinModel(
        name: name, details: details, candleSticks: candleSticks);
  }

  @override
  Future<List<dynamic>> getDataForCandleStickDetails(String name) async {
    final response = await dio.get(
        'https://min-api.cryptocompare.com/data/v2/histoday?fsym=$name&tsym=USD&limit=30');

    var data = response.data as Map<String, dynamic>;
    data = data['Data'] as Map<String, dynamic>;
    final arrayOfDays = data['Data'] as List<dynamic>;

    return arrayOfDays;
  }
}
