import 'package:crypto_coins_list/features/crypto_coin/crypto_coin.dart';
import 'package:crypto_coins_list/features/crypto_list/crypto_list.dart';

// class AppRoute extends _$AppRouter {

// }

final routes = {
  '/': (context) => const CryptoScreenList(),
  '/coin': (context) => const CryptoCoinScreen(),
};
