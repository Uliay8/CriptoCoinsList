import 'dart:async';

import 'package:cripto_coins_list/features/crypto_list/bloc/crypto_list_bloc.dart';
import 'package:cripto_coins_list/repositories/crypto_coins/abstract_coins_reprository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../widgets/widget.dart';

class CryptoScreenList extends StatefulWidget {
  const CryptoScreenList({
    super.key,
  });

  @override
  State<CryptoScreenList> createState() => _CryptoScreenListState();
}

class _CryptoScreenListState extends State<CryptoScreenList> {
  final _cryptoListBloc =
      CryptoListBloc(GetIt.instance<AbstractCoinsReprository>());

  @override
  void initState() {
    // _loadCryptoCoins();
    _cryptoListBloc.add(LoadCryptoList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Crypto Currencies List",
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            final completer = Completer();
            _cryptoListBloc.add(LoadCryptoList(completer: completer));
            return completer.future;
          },
          child: BlocBuilder<CryptoListBloc, CryptoListState>(
            bloc: _cryptoListBloc,
            builder: (context, state) {
              if (state is CryptoListLoaded) {
                return ListView.separated(
                    padding: const EdgeInsets.only(top: 8),
                    itemCount: state.coinsList.length,
                    separatorBuilder: (context, index) => const Divider(),
                    itemBuilder: (context, i) {
                      final coin = state.coinsList[i];
                      return CryptoCoinTile(coin: coin);
                    });
              }
              if (state is CryptoListLoadingFailure) {
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
                        style:
                            theme.textTheme.labelSmall?.copyWith(fontSize: 16),
                      ),
                      const SizedBox(height: 30),
                      TextButton(
                          onPressed: () {
                            _cryptoListBloc.add(LoadCryptoList());
                          },
                          child: const Text("Try again"))
                    ],
                  ),
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        )
        // RefreshIndicator(
        //   onRefresh: _loadCryptoCoins,
        //   child:
        // (_cryptoCoinsList == null)
        //     ? const Center(child: CircularProgressIndicator())
        //     : ListView.separated(
        //         padding: const EdgeInsets.only(top: 8),
        //         itemCount: _cryptoCoinsList!.length,
        //         separatorBuilder: (context, index) => const Divider(),
        //         itemBuilder: (context, i) {
        //           final coin = _cryptoCoinsList![i];
        //           return CryptoCoinTile(coin: coin);
        //         }),
        // ),
        );
  }

  // Future<void> _loadCryptoCoins() async {
  //   _cryptoCoinsList =
  //       await GetIt.instance<AbstractCoinsReprository>().getCoinsList();
  //   setState(() {});
  // }
}
