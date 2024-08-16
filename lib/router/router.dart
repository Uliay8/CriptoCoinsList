import 'package:cripto_coins_list/features/cripto_coin/cripto_coin.dart';
import 'package:cripto_coins_list/features/cripto_list/cripto_list.dart';

final routes = {
  '/': (context) => const CriptoScreenList(),
  '/coin': (context) => const CriptoCoinScreen(),
};
