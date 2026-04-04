import 'package:flutter/material.dart';
import 'component_metrics_theme.dart';
import 'spacing_theme.dart';
import 'radius_theme.dart';
import 'color_theme.dart';
import 'text_field_theme.dart';

extension ThemeX on BuildContext {
  ColorTheme get colors => Theme.of(this).extension<ColorTheme>()!;
  RadiusTheme get radius => Theme.of(this).extension<RadiusTheme>()!;
  SpacingTheme get spacing => Theme.of(this).extension<SpacingTheme>()!;
  TextFieldTheme get fields => Theme.of(this).extension<TextFieldTheme>()!;
  TextTheme get text => Theme.of(this).textTheme;
  ComponentMetricsTheme get metrics =>
      Theme.of(this).extension<ComponentMetricsTheme>()!;
}