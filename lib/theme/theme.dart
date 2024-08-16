import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  // primarySwatch: Colors.yellow,
  // primaryColor: Colors.yellow,
  // colorSchemeSeed: Colors.yellowAccent,
  // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
  // dividerColor: Colors.white24,
  appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(255, 31, 31, 31),
      centerTitle: true,
      titleTextStyle: TextStyle(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700)),
  scaffoldBackgroundColor: const Color.fromARGB(255, 31, 31, 31),
  listTileTheme: const ListTileThemeData(iconColor: Colors.white),
  textTheme: TextTheme(
      bodyMedium: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
        fontSize: 20,
      ),
      labelSmall: TextStyle(
        color: Colors.white.withOpacity(0.6),
        fontWeight: FontWeight.w700,
        fontSize: 14,
      )),
  useMaterial3: true,
);
