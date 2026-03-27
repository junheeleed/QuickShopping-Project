import 'package:flutter/material.dart';

@immutable
class ColorTheme extends ThemeExtension<ColorTheme> {
  final Color brand;
  final Color brandOn;
  final Color background;
  final Color surface;
  final Color surfaceAlt;
  final Color textPrimary;
  final Color textSecondary;
  final Color textTertiary;
  final Color divider;
  final Color border;
  final Color error;
  final Color success;

  const ColorTheme({
    required this.brand,
    required this.brandOn,
    required this.background,
    required this.surface,
    required this.surfaceAlt,
    required this.textPrimary,
    required this.textSecondary,
    required this.textTertiary,
    required this.divider,
    required this.border,
    required this.error,
    required this.success,
  });

  static ColorTheme fromBrightness(Brightness brightness) {
    if (brightness == Brightness.light) {
      return const ColorTheme(
        brand: Color(0xFF7B61FF),
        brandOn: Colors.white,
        background: Colors.white,
        surface: Colors.white,
        surfaceAlt: Color(0xFFF6F7F9),
        textPrimary: Colors.black,
        textSecondary: Color(0xFF555555),
        textTertiary: Color(0xFF999999),
        divider: Color(0xFFEDEDED),
        border: Color(0xFFE7E7E7),
        error: Color(0xFFE14B4B),
        success: Color(0xFF2DB400),
      );
    }

    return const ColorTheme(
      brand: Color(0xFF7B61FF),
      brandOn: Colors.white,
      background: Color(0xFF0F0F10),
      surface: Color(0xFF141416),
      surfaceAlt: Color(0xFF1B1B1E),
      textPrimary: Colors.white,
      textSecondary: Color(0xFFDDDDDD),
      textTertiary: Color(0xFF9A9A9A),
      divider: Color(0xFF2A2A2E),
      border: Color(0xFF2F2F35),
      error: Color(0xFFE14B4B),
      success: Color(0xFF2DB400),
    );
  }

  ColorScheme toColorScheme(Brightness brightness) {
    return ColorScheme(
      brightness: brightness,
      primary: brand,
      onPrimary: brandOn,

      secondary: brand,
      onSecondary: brandOn,

      error: error,
      onError: Colors.white,

      background: background, // TODO
      onBackground: textPrimary, // TODO

      surface: surface,
      onSurface: textPrimary,

      surfaceContainerHighest: surfaceAlt,
      onSurfaceVariant: textSecondary,

      outline: border,
      outlineVariant: divider,

      shadow: Colors.black,
      scrim: Colors.black,

      inverseSurface: textPrimary,
      onInverseSurface: background,
      inversePrimary: brand,
    );
  }

  @override
  ColorTheme copyWith({
    Color? brand,
    Color? brandOn,
    Color? background,
    Color? surface,
    Color? surfaceAlt,
    Color? textPrimary,
    Color? textSecondary,
    Color? textTertiary,
    Color? divider,
    Color? border,
    Color? error,
    Color? success,
  }) {
    return ColorTheme(
      brand: brand ?? this.brand,
      brandOn: brandOn ?? this.brandOn,
      background: background ?? this.background,
      surface: surface ?? this.surface,
      surfaceAlt: surfaceAlt ?? this.surfaceAlt,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textTertiary: textTertiary ?? this.textTertiary,
      divider: divider ?? this.divider,
      border: border ?? this.border,
      error: error ?? this.error,
      success: success ?? this.success,
    );
  }

  @override
  ColorTheme lerp(ThemeExtension<ColorTheme>? other, double t) {
    if (other is! ColorTheme) return this;

    Color mix(Color a, Color b) => Color.lerp(a, b, t)!;

    return ColorTheme(
      brand: mix(brand, other.brand),
      brandOn: mix(brandOn, other.brandOn),
      background: mix(background, other.background),
      surface: mix(surface, other.surface),
      surfaceAlt: mix(surfaceAlt, other.surfaceAlt),
      textPrimary: mix(textPrimary, other.textPrimary),
      textSecondary: mix(textSecondary, other.textSecondary),
      textTertiary: mix(textTertiary, other.textTertiary),
      divider: mix(divider, other.divider),
      border: mix(border, other.border),
      error: mix(error, other.error),
      success: mix(success, other.success),
    );
  }
}