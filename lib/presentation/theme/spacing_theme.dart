import 'package:flutter/material.dart';

import '../responsive/responsive.dart';
import 'app_theme_scale.dart';

@immutable
class SpacingTheme extends ThemeExtension<SpacingTheme> {
  final double pagePaddingX;
  final double sectionGap;
  final double itemGap;
  final double cardPadding;
  final double gridSpacing;
  final double bottomBarPaddingX;

  const SpacingTheme({
    required this.pagePaddingX,
    required this.sectionGap,
    required this.itemGap,
    required this.cardPadding,
    required this.gridSpacing,
    required this.bottomBarPaddingX,
  });

  factory SpacingTheme.fromSize(ScreenSize size) {
    final scale = AppThemeScale.spacingOf(size);
    return SpacingTheme(
      pagePaddingX: scale.pagePaddingX,
      sectionGap: scale.sectionGap,
      itemGap: scale.itemGap,
      cardPadding: scale.cardPadding,
      gridSpacing: scale.gridSpacing,
      bottomBarPaddingX: scale.bottomBarPaddingX,
    );
  }

  @override
  SpacingTheme copyWith({
    double? pagePaddingX,
    double? sectionGap,
    double? itemGap,
    double? cardPadding,
    double? gridSpacing,
    double? bottomBarPaddingX,
  }) {
    return SpacingTheme(
      pagePaddingX: pagePaddingX ?? this.pagePaddingX,
      sectionGap: sectionGap ?? this.sectionGap,
      itemGap: itemGap ?? this.itemGap,
      cardPadding: cardPadding ?? this.cardPadding,
      gridSpacing: gridSpacing ?? this.gridSpacing,
      bottomBarPaddingX: bottomBarPaddingX ?? this.bottomBarPaddingX,
    );
  }

  @override
  SpacingTheme lerp(ThemeExtension<SpacingTheme>? other, double t) {
    if (other is! SpacingTheme) return this;

    return SpacingTheme(
      pagePaddingX: pagePaddingX + (other.pagePaddingX - pagePaddingX) * t,
      sectionGap: sectionGap + (other.sectionGap - sectionGap) * t,
      itemGap: itemGap + (other.itemGap - itemGap) * t,
      cardPadding: cardPadding + (other.cardPadding - cardPadding) * t,
      gridSpacing: gridSpacing + (other.gridSpacing - gridSpacing) * t,
      bottomBarPaddingX: bottomBarPaddingX + (other.bottomBarPaddingX - bottomBarPaddingX) * t,
    );
  }
}