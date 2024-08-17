import 'package:cripto_coins_list/repositories/crypto_coins/abstract_coins_reprository.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../widgets/widget.dart';
import 'package:cripto_coins_list/repositories/crypto_coins/models/crypto_coin_model.dart';

class CryptoScreenList extends StatefulWidget {
  const CryptoScreenList({
    super.key,
  });

  @override
  State<CryptoScreenList> createState() => _CryptoScreenListState();
}

class _CryptoScreenListState extends State<CryptoScreenList> {
  List<CryptoCoinModel>? _cryptoCoinsList;

  @override
  void initState() {
    _loadCryptoCoins();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Crypto Currencies List",
        ),
      ),
      body: RefreshIndicator(
        onRefresh: _loadCryptoCoins,
        child: (_cryptoCoinsList == null)
            ? const Center(child: CircularProgressIndicator())
            : ListView.separated(
                padding: const EdgeInsets.only(top: 8),
                itemCount: _cryptoCoinsList!.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, i) {
                  final coin = _cryptoCoinsList![i];
                  return CryptoCoinTile(coin: coin);
                }),
      ),
    );
  }

  Future<void> _loadCryptoCoins() async {
    _cryptoCoinsList =
        await GetIt.instance<AbstractCoinsReprository>().getCoinsList();
    setState(() {});
  }
}
