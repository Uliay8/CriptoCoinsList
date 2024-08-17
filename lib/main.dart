import 'package:cripto_coins_list/crypto_currencies_list_app.dart';
import 'package:cripto_coins_list/repositories/crypto_coins/abstract_coins_reprository.dart';
import 'package:cripto_coins_list/repositories/crypto_coins/crypto_coins_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  GetIt.I.registerLazySingleton<AbstractCoinsReprository>(
      () => CryptoCoinsRepository(dio: Dio()));
  runApp(const CryptoCurrenciesListApp());
}
