import 'package:auto_route/auto_route.dart';
import 'package:crypto_coins_list/features/crypto_coin/crypto_coin.dart';
import 'package:crypto_coins_list/features/crypto_list/crypto_list.dart';
import 'package:flutter/material.dart';

import '../repositories/crypto_coins/models/crypto_coin_model.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: CryptoRouteList.page, path: "/"),
        AutoRoute(page: CryptoCoinRoute.page),
      ];
}

// final routes = {
//   '/': (context) => const CryptoScreenList(),
//   '/coin': (context) => const CryptoCoinScreen(),
// };
