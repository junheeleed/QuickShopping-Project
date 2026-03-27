import 'package:flutter/material.dart';

import '../responsive/responsive.dart';
import 'app_theme_scale.dart';
import 'color_theme.dart';

class AppTextTheme {
  static TextTheme fromSize(ScreenSize size, ColorTheme colors) {
    final scale = AppThemeScale.type[size]!;

    return TextTheme(
      titleLarge: TextStyle(
        fontSize: scale.title,
        fontWeight: FontWeight.w900,
        color: colors.textPrimary,
      ),
      titleMedium: TextStyle(
        fontSize: scale.title - 2,
        fontWeight: FontWeight.w800,
        color: colors.textPrimary,
      ),
      bodyMedium: TextStyle(
        fontSize: scale.body,
        fontWeight: FontWeight.w700,
        color: colors.textPrimary,
      ),
      bodySmall: TextStyle(
        fontSize: scale.caption,
        fontWeight: FontWeight.w700,
        color: colors.textSecondary,
      ),
      labelLarge: TextStyle(
        fontSize: scale.body,
        fontWeight: FontWeight.w900,
        color: colors.textPrimary,
      ),
    );
  }
}