import '../responsive/responsive.dart';

class AppThemeScale {
  static const _type = {
    ScreenSize.compact: TypeScale(body: 14, title: 18, caption: 12),
    ScreenSize.medium: TypeScale(body: 15, title: 19, caption: 13),
    ScreenSize.expanded: TypeScale(body: 16, title: 20, caption: 14),
  };

  static const _spacing = {
    ScreenSize.compact: SpacingScale(
      pagePaddingX: 16,
      sectionGap: 12,
      itemGap: 8,
      cardPadding: 16,
      gridSpacing: 12,
      bottomBarPaddingX: 12,
    ),
    ScreenSize.medium: SpacingScale(
      pagePaddingX: 20,
      sectionGap: 14,
      itemGap: 10,
      cardPadding: 18,
      gridSpacing: 14,
      bottomBarPaddingX: 16,
    ),
    ScreenSize.expanded: SpacingScale(
      pagePaddingX: 24,
      sectionGap: 16,
      itemGap: 12,
      cardPadding: 20,
      gridSpacing: 16,
      bottomBarPaddingX: 16,
    ),
  };

  static const _radius = {
    ScreenSize.compact: RadiusScale(button: 10, card: 18, image: 16),
    ScreenSize.medium: RadiusScale(button: 12, card: 18, image: 16),
    ScreenSize.expanded: RadiusScale(button: 14, card: 20, image: 18),
  };

  static const _field = {
    ScreenSize.compact: FieldScale(
      height: 47,
      horizontalPadding: 14,
      borderWidth: 1,
    ),
    ScreenSize.medium: FieldScale(
      height: 50,
      horizontalPadding: 14,
      borderWidth: 1,
    ),
    ScreenSize.expanded: FieldScale(
      height: 52,
      horizontalPadding: 16,
      borderWidth: 1,
    ),
  };

  static TypeScale typeOf(ScreenSize size) => _type[size]!;
  static SpacingScale spacingOf(ScreenSize size) => _spacing[size]!;
  static RadiusScale radiusOf(ScreenSize size) => _radius[size]!;
  static FieldScale fieldOf(ScreenSize size) => _field[size]!;
}

class TypeScale {
  final double body;
  final double title;
  final double caption;

  const TypeScale({
    required this.body,
    required this.title,
    required this.caption,
  });
}

class SpacingScale {
  final double pagePaddingX;
  final double sectionGap;
  final double itemGap;
  final double cardPadding;
  final double gridSpacing;
  final double bottomBarPaddingX;

  const SpacingScale({
    required this.pagePaddingX,
    required this.sectionGap,
    required this.itemGap,
    required this.cardPadding,
    required this.gridSpacing,
    required this.bottomBarPaddingX,
  });
}

class RadiusScale {
  final double button;
  final double card;
  final double image;

  const RadiusScale({
    required this.button,
    required this.card,
    required this.image,
  });
}

class FieldScale {
  final double height;
  final double horizontalPadding;
  final double borderWidth;

  const FieldScale({
    required this.height,
    required this.horizontalPadding,
    required this.borderWidth,
  });
}