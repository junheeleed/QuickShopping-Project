import 'package:flutter/material.dart';

import '../responsive/responsive.dart';
import 'app_theme_scale.dart';

@immutable
class RadiusTheme extends ThemeExtension<RadiusTheme> {
  final double button;
  final double card;
  final double image;

  const RadiusTheme({
    required this.button,
    required this.card,
    required this.image,
  });

  static RadiusTheme fromSize(ScreenSize size) {
    final scale = AppThemeScale.radius[size]!;

    return RadiusTheme(
      button: scale.button,
      card: scale.card,
      image: scale.image,
    );
  }

  @override
  RadiusTheme copyWith({
    double? button,
    double? card,
    double? image,
  }) {
    return RadiusTheme(
      button: button ?? this.button,
      card: card ?? this.card,
      image: image ?? this.image,
    );
  }

  @override
  RadiusTheme lerp(ThemeExtension<RadiusTheme>? other, double t) {
    if (other is! RadiusTheme) return this;

    return RadiusTheme(
      button: button + (other.button - button) * t,
      card: card + (other.card - card) * t,
      image: image + (other.image - image) * t,
    );
  }
}