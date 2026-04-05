import 'package:flutter/material.dart';

import '../responsive/responsive.dart';
import 'app_theme_scale.dart';
import 'radius_theme.dart';

@immutable
class TextFieldTheme extends ThemeExtension<TextFieldTheme> {
  final double height;
  final double horizontalPadding;
  final double radius;
  final double borderWidth;

  const TextFieldTheme({
    required this.height,
    required this.horizontalPadding,
    required this.radius,
    required this.borderWidth,
  });

  static TextFieldTheme fromSize(ScreenSize size, RadiusTheme radiusTheme) {
    final scale = AppThemeScale.fieldOf(size);

    return TextFieldTheme(
      height: scale.height,
      horizontalPadding: scale.horizontalPadding,
      radius: radiusTheme.button,
      borderWidth: scale.borderWidth,
    );
  }

  @override
  TextFieldTheme copyWith({
    double? height,
    double? horizontalPadding,
    double? radius,
    double? borderWidth,
  }) {
    return TextFieldTheme(
      height: height ?? this.height,
      horizontalPadding: horizontalPadding ?? this.horizontalPadding,
      radius: radius ?? this.radius,
      borderWidth: borderWidth ?? this.borderWidth,
    );
  }

  @override
  TextFieldTheme lerp(ThemeExtension<TextFieldTheme>? other, double t) {
    if (other is! TextFieldTheme) return this;

    return TextFieldTheme(
      height: height + (other.height - height) * t,
      horizontalPadding: horizontalPadding + (other.horizontalPadding - horizontalPadding) * t,
      radius: radius + (other.radius - radius) * t,
      borderWidth: borderWidth + (other.borderWidth - borderWidth) * t,
    );
  }
}