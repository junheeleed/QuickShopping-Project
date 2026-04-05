import 'package:flutter/material.dart';
import 'package:quick_shopping/presentation/theme/text_field_theme.dart';

import '../responsive/responsive.dart';
import 'app_text_theme.dart';
import 'color_theme.dart';
import 'component_metrics_theme.dart';
import 'radius_theme.dart';
import 'spacing_theme.dart';

class AppTheme {
  static ThemeData forSize(ScreenSize size, Brightness brightness) {
    final colors = ColorTheme.fromBrightness(brightness);
    final radius = RadiusTheme.fromSize(size);
    final spacing = SpacingTheme.fromSize(size);
    final field = TextFieldTheme.fromSize(size, radius);
    final textTheme = AppTextTheme.fromSize(size, colors, brightness);
    final metrics = ComponentMetricsTheme.fromSize(size);

    final scheme = colors.toColorScheme(brightness);

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: colors.background,
      canvasColor: colors.background,
      textTheme: textTheme,

      appBarTheme: AppBarTheme(
        backgroundColor: colors.background,
        foregroundColor: colors.textPrimary,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        iconTheme: IconThemeData(color: colors.textPrimary), // TODO Icon 색상 따로 필드 만들기
        titleTextStyle: textTheme.titleLarge,
      ),

      cardTheme: CardThemeData(
        color: colors.surface,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: radius.cardRadius,
          side: BorderSide(color: colors.border),
        ),
      ),

      dividerTheme: DividerThemeData(
        color: colors.divider,
        thickness: 1,
        space: spacing.sectionGap,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colors.surface,
        contentPadding: EdgeInsets.symmetric(
          horizontal: field.horizontalPadding,
          vertical: 0,
        ),
        border: OutlineInputBorder(
          borderRadius: radius.buttonRadius,
          borderSide: BorderSide(
            color: colors.border,
            width: field.borderWidth,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: radius.buttonRadius,
          borderSide: BorderSide(
            color: colors.border,
            width: field.borderWidth,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: radius.buttonRadius,
          borderSide: BorderSide(
            color: colors.brand,
            width: field.borderWidth,
          ),
        ),
        hintStyle: textTheme.bodyMedium?.copyWith(
          color: colors.textTertiary,
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: colors.brand,
          foregroundColor: colors.brandOn,
          disabledBackgroundColor: colors.divider,
          disabledForegroundColor: colors.textTertiary,
          minimumSize: Size.fromHeight(field.height),
          padding: EdgeInsets.symmetric(horizontal: spacing.cardPadding),
          shape: RoundedRectangleBorder(
            borderRadius: radius.buttonRadius,
          ),
          textStyle: textTheme.labelLarge,
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colors.textPrimary,
          backgroundColor: colors.surface,
          minimumSize: Size.fromHeight(field.height),
          padding: EdgeInsets.symmetric(horizontal: spacing.cardPadding),
          shape: RoundedRectangleBorder(
            borderRadius: radius.buttonRadius,
          ),
          side: BorderSide(color: colors.border),
          textStyle: textTheme.labelLarge,
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colors.textPrimary,
          minimumSize: Size.fromHeight(field.height),
          padding: EdgeInsets.symmetric(horizontal: spacing.itemGap),
          shape: RoundedRectangleBorder(
            borderRadius: radius.buttonRadius,
          ),
          textStyle: textTheme.labelLarge,
        ),
      ),

      extensions: <ThemeExtension<dynamic>>[
        colors,
        spacing,
        radius,
        field,
        metrics,
      ],
    );
  }
}