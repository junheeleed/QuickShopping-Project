import 'dart:ui' show lerpDouble;
import 'package:flutter/material.dart';
import '../responsive/responsive.dart';

@immutable
class ComponentMetricsTheme extends ThemeExtension<ComponentMetricsTheme> {
  final double searchBarHeight;
  final double searchIconButtonSize;
  final double bottomNavHeight;
  final double avatarSize;
  final double heroImageHeight;
  final double heroImageIconSize;
  final double productPriceValue;
  final double productPriceUnit;
  final double badgeVerticalPadding;
  final double badgeHorizontalPadding;
  final double smallIcon;
  final double mediumIcon;
  final double bannerHeight;
  final double bannerTitle;
  final double bannerSubtitle;
  final double homeBrandTitle;
  final double homeCompactGridTileHeight;
  final double homeSkeletonImageSize;

  const ComponentMetricsTheme({
    required this.searchBarHeight,
    required this.searchIconButtonSize,
    required this.bottomNavHeight,
    required this.avatarSize,
    required this.heroImageHeight,
    required this.heroImageIconSize,
    required this.productPriceValue,
    required this.productPriceUnit,
    required this.badgeVerticalPadding,
    required this.badgeHorizontalPadding,
    required this.smallIcon,
    required this.mediumIcon,
    required this.bannerHeight,
    required this.bannerTitle,
    required this.bannerSubtitle,
    required this.homeBrandTitle,
    required this.homeCompactGridTileHeight,
    required this.homeSkeletonImageSize,
  });

  factory ComponentMetricsTheme.fromSize(ScreenSize size) {
    switch (size) {
      case ScreenSize.compact:
        return const ComponentMetricsTheme(
          searchBarHeight: 48,
          searchIconButtonSize: 40,
          bottomNavHeight: 72,
          avatarSize: 56,
          heroImageHeight: 240,
          heroImageIconSize: 64,
          productPriceValue: 24,
          productPriceUnit: 16,
          badgeVerticalPadding: 6,
          badgeHorizontalPadding: 10,
          smallIcon: 18,
          mediumIcon: 20,
          bannerHeight: 190,
          bannerTitle: 24,
          bannerSubtitle: 15,
          homeBrandTitle: 22,
          homeCompactGridTileHeight: 170,
          homeSkeletonImageSize: 64,
        );
      case ScreenSize.medium:
        return const ComponentMetricsTheme(
          searchBarHeight: 52,
          searchIconButtonSize: 44,
          bottomNavHeight: 76,
          avatarSize: 60,
          heroImageHeight: 280,
          heroImageIconSize: 72,
          productPriceValue: 28,
          productPriceUnit: 18,
          badgeVerticalPadding: 6,
          badgeHorizontalPadding: 12,
          smallIcon: 18,
          mediumIcon: 22,
          bannerHeight: 220,
          bannerTitle: 26,
          bannerSubtitle: 16,
          homeBrandTitle: 24,
          homeCompactGridTileHeight: 180,
          homeSkeletonImageSize: 72,
        );
      case ScreenSize.expanded:
        return const ComponentMetricsTheme(
          searchBarHeight: 56,
          searchIconButtonSize: 48,
          bottomNavHeight: 80,
          avatarSize: 64,
          heroImageHeight: 320,
          heroImageIconSize: 76,
          productPriceValue: 32,
          productPriceUnit: 20,
          badgeVerticalPadding: 8,
          badgeHorizontalPadding: 14,
          smallIcon: 20,
          mediumIcon: 24,
          bannerHeight: 240,
          bannerTitle: 28,
          bannerSubtitle: 17,
          homeBrandTitle: 26,
          homeCompactGridTileHeight: 190,
          homeSkeletonImageSize: 80,
        );
    }
  }

  @override
  ComponentMetricsTheme copyWith({
    double? searchBarHeight,
    double? searchIconButtonSize,
    double? bottomNavHeight,
    double? avatarSize,
    double? heroImageHeight,
    double? heroImageIconSize,
    double? productPriceValue,
    double? productPriceUnit,
    double? badgeVerticalPadding,
    double? badgeHorizontalPadding,
    double? smallIcon,
    double? mediumIcon,
    double? bannerHeight,
    double? bannerTitle,
    double? bannerSubtitle,
    double? homeBrandTitle,
    double? homeCompactGridTileHeight,
    double? homeSkeletonImageSize,
  }) {
    return ComponentMetricsTheme(
      searchBarHeight: searchBarHeight ?? this.searchBarHeight,
      searchIconButtonSize: searchIconButtonSize ?? this.searchIconButtonSize,
      bottomNavHeight: bottomNavHeight ?? this.bottomNavHeight,
      avatarSize: avatarSize ?? this.avatarSize,
      heroImageHeight: heroImageHeight ?? this.heroImageHeight,
      heroImageIconSize: heroImageIconSize ?? this.heroImageIconSize,
      productPriceValue: productPriceValue ?? this.productPriceValue,
      productPriceUnit: productPriceUnit ?? this.productPriceUnit,
      badgeVerticalPadding:
      badgeVerticalPadding ?? this.badgeVerticalPadding,
      badgeHorizontalPadding:
      badgeHorizontalPadding ?? this.badgeHorizontalPadding,
      smallIcon: smallIcon ?? this.smallIcon,
      mediumIcon: mediumIcon ?? this.mediumIcon,
      bannerHeight: bannerHeight ?? this.bannerHeight,
      bannerTitle: bannerTitle ?? this.bannerTitle,
      bannerSubtitle: bannerSubtitle ?? this.bannerSubtitle,
      homeBrandTitle: homeBrandTitle ?? this.homeBrandTitle,
      homeCompactGridTileHeight: homeCompactGridTileHeight ?? this.homeCompactGridTileHeight,
      homeSkeletonImageSize: homeSkeletonImageSize ?? this.homeSkeletonImageSize,
    );
  }

  @override
  ThemeExtension<ComponentMetricsTheme> lerp(
      covariant ThemeExtension<ComponentMetricsTheme>? other,
      double t,
      ) {
    if (other is! ComponentMetricsTheme) return this;

    return ComponentMetricsTheme(
      searchBarHeight: lerpDouble(searchBarHeight, other.searchBarHeight, t)!,
      searchIconButtonSize:
      lerpDouble(searchIconButtonSize, other.searchIconButtonSize, t)!,
      bottomNavHeight: lerpDouble(bottomNavHeight, other.bottomNavHeight, t)!,
      avatarSize: lerpDouble(avatarSize, other.avatarSize, t)!,
      heroImageHeight: lerpDouble(heroImageHeight, other.heroImageHeight, t)!,
      heroImageIconSize:
      lerpDouble(heroImageIconSize, other.heroImageIconSize, t)!,
      productPriceValue:
      lerpDouble(productPriceValue, other.productPriceValue, t)!,
      productPriceUnit:
      lerpDouble(productPriceUnit, other.productPriceUnit, t)!,
      badgeVerticalPadding:
      lerpDouble(badgeVerticalPadding, other.badgeVerticalPadding, t)!,
      badgeHorizontalPadding:
      lerpDouble(badgeHorizontalPadding, other.badgeHorizontalPadding, t)!,
      smallIcon: lerpDouble(smallIcon, other.smallIcon, t)!,
      mediumIcon: lerpDouble(mediumIcon, other.mediumIcon, t)!,
      bannerHeight: lerpDouble(bannerHeight, other.bannerHeight, t)!,
      bannerTitle: lerpDouble(bannerTitle, other.bannerTitle, t)!,
      bannerSubtitle: lerpDouble(bannerSubtitle, other.bannerSubtitle, t)!,
      homeBrandTitle: lerpDouble(homeBrandTitle, other.homeBrandTitle, t)!,
      homeCompactGridTileHeight: lerpDouble(homeCompactGridTileHeight, other.homeCompactGridTileHeight, t)!,
      homeSkeletonImageSize: lerpDouble(homeSkeletonImageSize, other.homeSkeletonImageSize, t)!,
    );
  }
}