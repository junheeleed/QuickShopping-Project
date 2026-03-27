  import 'package:flutter/material.dart';

import '../responsive/responsive.dart';
import 'app_text_theme.dart';
import 'color_theme.dart';
import 'radius_theme.dart';
import 'spacing_theme.dart';
import 'text_field_theme.dart';

class AppTheme {
  static ThemeData forSize(ScreenSize size, Brightness brightness) {
    final colors = ColorTheme.fromBrightness(brightness);
    final radius = RadiusTheme.fromSize(size);
    final spacing = SpacingTheme.fromSize(size);
    final fields = TextFieldTheme.fromSize(size, radius);
    final textTheme = AppTextTheme.fromSize(size, colors);

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
        titleTextStyle: textTheme.titleLarge?.copyWith(
          color: colors.textPrimary,
          fontWeight: FontWeight.w900,
        ),
      ),

      cardTheme: CardThemeData(
        color: colors.surface,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius.card),
          side: BorderSide(color: colors.border),
        ),
      ),

      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: colors.surface,
        surfaceTintColor: Colors.transparent,
        modalBackgroundColor: colors.surface,
        modalBarrierColor: Colors.black54,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(radius.card),
          ),
        ),
      ),

      dialogTheme: DialogThemeData(
        backgroundColor: colors.surface,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius.card),
          side: BorderSide(color: colors.border),
        ),
        titleTextStyle: textTheme.titleMedium?.copyWith(
          color: colors.textPrimary,
          fontWeight: FontWeight.w900,
        ),
        contentTextStyle: textTheme.bodyMedium?.copyWith(
          color: colors.textSecondary,
        ),
      ),

      dividerTheme: DividerThemeData(
        color: colors.divider,
        thickness: 1,
      ),
      inputDecorationTheme: InputDecorationTheme(
        isDense: true,
        border: InputBorder.none,
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
          textStyle: textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w900,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius.button),
          ),
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colors.textPrimary,
          backgroundColor: colors.surface,
          textStyle: textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w900,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius.button),
          ),
          side: BorderSide(color: colors.border),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colors.textPrimary,
          textStyle: textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
      ),


      listTileTheme: ListTileThemeData(
        tileColor: colors.surface,
        iconColor: colors.textPrimary,
        textColor: colors.textPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius.card),
        ),
      ),

      extensions: <ThemeExtension<dynamic>>[
        colors,
        spacing,
        radius,
        fields,
      ],
    );
  }
}