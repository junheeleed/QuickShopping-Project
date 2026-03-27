import 'package:flutter/material.dart';
import 'spacing_theme.dart';
import 'radius_theme.dart';
import 'color_theme.dart';
import 'text_field_theme.dart';

extension ThemeX on BuildContext {
  TextTheme get text => Theme.of(this).textTheme;

  SpacingTheme get spacing => Theme.of(this).extension<SpacingTheme>()!;
  RadiusTheme get radius => Theme.of(this).extension<RadiusTheme>()!;
  ColorTheme get colors => Theme.of(this).extension<ColorTheme>()!;
  TextFieldTheme get fields => Theme.of(this).extension<TextFieldTheme>()!;
}