import 'package:cripto_coins_list/features/crypto_coin/widgets/coin_tile_with_percent.dart';
import 'package:cripto_coins_list/features/crypto_coin/widgets/widget.dart';
import 'package:cripto_coins_list/repositories/crypto_coins/models/crypto_coin_details_model.dart';
import 'package:cripto_coins_list/repositories/crypto_coins/models/crypto_coin_model.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../repositories/crypto_coins/abstract_coins_reprository.dart';
import '../../candle_stick/candle_stick.dart';

class CryptoCoinScreen extends StatefulWidget {
  const CryptoCoinScreen({super.key});

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {
  CryptoCoinModel? coin;
  CryptoCoinDetailsModel? cryptoCoinDetails;

  @override
  void initState() {
    super.initState();
    // _loadCryptoCoins(coin!.name, coin!.imageURL);
  }

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    assert(args != null && args is CryptoCoinModel,
        'You must provide CryptoCoin argument');
    coin = args as CryptoCoinModel;
    setState(() {});
    _loadCryptoCoins(coin!.name, coin!.imageURL);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        //сюда надо функцию на возврат на coin_list
        title: Padding(
          padding: const EdgeInsets.only(right: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Image.network(
                  coin!.imageURL,
                  width: 30,
                  height: 30,
                ),
              ),
              Text(coin?.name ?? '...')
            ],
          ),
        ),
      ),
      body: (cryptoCoinDetails == null)
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                CoinTileWithPercent(
                    openPeriodPrice: cryptoCoinDetails!.list.first.open,
                    closePeriodPrice: cryptoCoinDetails!.list.last.close),
                Stack(
                  children: [
                    Container(
                        width: double.infinity,
                        height: 380,
                        padding: const EdgeInsets.only(
                            left: 8, right: 20, top: 10, bottom: 10),
                        child:
                            GridGraph(cryptoCoinDetails: cryptoCoinDetails!)),
                    Container(
                        width: double.infinity,
                        height: 380,
                        padding: const EdgeInsets.only(
                            left: 70, right: 20, top: 10, bottom: 10),
                        child: CoinGraph(cryptoCoinDetails: cryptoCoinDetails!))
                  ],
                )
              ],
            ),
    );
  }

  Future<void> _loadCryptoCoins(String name, String imageUrl) async {
    cryptoCoinDetails = await GetIt.instance<AbstractCoinsReprository>()
        .getCoinDetails(name, imageUrl);
    setState(() {});
  }
}
