import 'package:cripto_coins_list/features/crypto_coin/bloc/crypto_coin_bloc.dart';
import 'package:cripto_coins_list/features/crypto_coin/widgets/coin_tile_with_percent.dart';
import 'package:cripto_coins_list/features/crypto_coin/widgets/widget.dart';
import 'package:cripto_coins_list/repositories/crypto_coins/models/crypto_coin_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../repositories/crypto_coins/abstract_coins_reprository.dart';
import '../../candle_stick/candle_stick.dart';

class CryptoCoinScreen extends StatefulWidget {
  const CryptoCoinScreen({
    super.key,
    // required this.coin
  });
  // final CryptoCoinModel coin;

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {
  CryptoCoinModel? coin;
  CryptoCoinBloc _cryptoCoinBloc =
      CryptoCoinBloc(GetIt.instance<AbstractCoinsReprository>());

  @override
  void initState() {
    // _cryptoCoinBloc.add(LoadCryptoCoin(
    // nameCoin: widget.coin.name, imageURL: widget.coin.imageURL));
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    assert(args != null && args is CryptoCoinModel,
        'You must provide CryptoCoin argument');
    coin = args as CryptoCoinModel;
    setState(() {});
    _cryptoCoinBloc =
        CryptoCoinBloc(GetIt.instance<AbstractCoinsReprository>());
    _cryptoCoinBloc
        .add(LoadCryptoCoin(nameCoin: coin!.name, imageURL: coin!.imageURL));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        title: Padding(
          padding: const EdgeInsets.only(right: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Image.network(
                  // widget.coin.imageURL,
                  coin!.imageURL,
                  width: 30,
                  height: 30,
                ),
              ),
              Text(
                  // widget.coin.name
                  coin!.name)
            ],
          ),
        ),
      ),
      body: BlocBuilder<CryptoCoinBloc, CryptoCoinState>(
        bloc: _cryptoCoinBloc,
        builder: (context, state) {
          if (state is CryptoCoinLoaded) {
            return Column(
              children: [
                CoinTileWithPercent(
                    openPeriodPrice: state.coinDetails.list.first.open,
                    closePeriodPrice: state.coinDetails.list.last.close),
                Stack(
                  children: [
                    Container(
                        width: double.infinity,
                        height: 350,
                        padding: const EdgeInsets.only(
                            left: 8, right: 20, top: 10, bottom: 10),
                        child: GridGraph(cryptoCoinDetails: state.coinDetails)),
                    Container(
                        width: double.infinity,
                        height: 350,
                        padding: const EdgeInsets.only(
                            left: 70, right: 20, top: 10, bottom: 10),
                        child: CoinGraph(cryptoCoinDetails: state.coinDetails))
                  ],
                )
              ],
            );
          }
          if (state is CryptoCoinLoadingFailure) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Something went wrong...",
                    style: theme.textTheme.headlineMedium,
                  ),
                  Text(
                    "Please try again later",
                    style: theme.textTheme.labelSmall?.copyWith(fontSize: 16),
                  ),
                  const SizedBox(height: 30),
                  TextButton(
                      onPressed: () {
                        _cryptoCoinBloc.add(LoadCryptoCoin(
                            // nameCoin: widget.coin.name,
                            // imageURL: widget.coin.imageURL));
                            nameCoin: coin!.name,
                            imageURL: coin!.imageURL));
                      },
                      child: const Text("Try again"))
                ],
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
