import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  progressIndicatorTheme:
      const ProgressIndicatorThemeData(color: Colors.yellow),
  // primarySwatch: Colors.yellow,
  // primaryColor: Colors.deepOrange,
  colorSchemeSeed: Colors.yellow,
  // colorScheme: ColorScheme(brightness: brightness, primary: primary, onPrimary: onPrimary, secondary: secondary, onSecondary: onSecondary, error: error, onError: onError, surface: surface, onSurface: onSurface),
  // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
  // dividerColor: Colors.white24,
  dividerTheme: const DividerThemeData(color: Colors.white24),
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
