import 'dart:ui';

import 'package:flutter/material.dart';

import '../responsive/responsive.dart';
import 'app_theme_scale.dart';
import 'color_theme.dart';

class AppTextTheme {
  static TextTheme fromSize(
      ScreenSize size,
      ColorTheme colors,
      Brightness brightness) {
    final scale = AppThemeScale.typeOf(size);

    final base = Typography.material2021(
      colorScheme: colors.toColorScheme(brightness),
    ).black;

    return base.copyWith(
      headlineSmall: base.headlineSmall?.copyWith(
        fontSize: scale.title + 4,
        fontWeight: FontWeight.w700,
        color: colors.textPrimary,
        height: 1.25,
      ),
      titleLarge: base.titleLarge?.copyWith(
        fontSize: scale.title,
        fontWeight: FontWeight.w700,
        color: colors.textPrimary,
        height: 1.3,
      ),
      titleMedium: base.titleMedium?.copyWith(
        fontSize: scale.title - 2,
        fontWeight: FontWeight.w600,
        color: colors.textPrimary,
        height: 1.3,
      ),
      bodyLarge: base.bodyLarge?.copyWith(
        fontSize: scale.body + 1,
        fontWeight: FontWeight.w500,
        color: colors.textPrimary,
        height: 1.45,
      ),
      bodyMedium: base.bodyMedium?.copyWith(
        fontSize: scale.body,
        fontWeight: FontWeight.w400,
        color: colors.textPrimary,
        height: 1.45,
      ),
      bodySmall: base.bodySmall?.copyWith(
        fontSize: scale.caption,
        fontWeight: FontWeight.w400,
        color: colors.textSecondary,
        height: 1.4,
      ),
      labelLarge: base.labelLarge?.copyWith(
        fontSize: scale.body,
        fontWeight: FontWeight.w600,
        color: colors.textPrimary,
        height: 1.2,
      ),
      labelMedium: base.labelMedium?.copyWith(
        fontSize: scale.caption,
        fontWeight: FontWeight.w600,
        color: colors.textSecondary,
        height: 1.2,
      ),
      labelSmall: base.labelSmall?.copyWith(
        fontSize: scale.caption - 1,
        fontWeight: FontWeight.w500,
        color: colors.textTertiary,
        height: 1.2,
      ),
    );
  }
}