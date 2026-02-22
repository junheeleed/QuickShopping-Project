import 'package:flutter/material.dart';

class AppTheme {
  static const _seed = Color(0xFF03C75A);

  static final light = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: _seed),
    appBarTheme: const AppBarTheme(centerTitle: false),
  );

  static final dark = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: _seed, brightness: Brightness.dark),
    appBarTheme: const AppBarTheme(centerTitle: false),
  );
}
