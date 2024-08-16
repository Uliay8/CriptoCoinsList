import 'package:cripto_coins_list/router/router.dart';
import 'package:cripto_coins_list/theme/theme.dart';
import 'package:flutter/material.dart';

class CriptoCurrenciesListApp extends StatelessWidget {
  const CriptoCurrenciesListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CriptoCurrenciesList',
      theme: darkTheme,
      routes: routes,
    );
  }
}
