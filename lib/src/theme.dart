import 'package:flutter/material.dart';

/// Theme-aware modifiers for any widget and text theme shortcuts.
///
/// Provides chainable methods to override theme data and
/// apply text theme styles from the current theme.
extension ThemeModifier on Widget {
  /// Wraps the widget in a [Theme] with the given [ThemeData].
  ///
  /// ```dart
  /// widget.withTheme(ThemeData.dark())
  /// ```
  Widget withTheme(ThemeData data) {
    return Theme(
      data: data,
      child: this,
    );
  }

  /// Wraps the widget in a [Theme] that copies and overrides
  /// properties of the current theme.
  ///
  /// Uses a [Builder] to access the current [BuildContext].
  ///
  /// ```dart
  /// widget.overrideTheme((theme) => theme.copyWith(
  ///   primaryColor: Colors.purple,
  /// ))
  /// ```
  Widget overrideTheme(ThemeData Function(ThemeData current) override) {
    return Builder(
      builder: (context) {
        return Theme(
          data: override(Theme.of(context)),
          child: this,
        );
      },
    );
  }
}

/// Text theme modifiers for the [Text] widget.
///
/// Apply theme-based text styles using the current [BuildContext].
///
/// ```dart
/// Text("Title").headlineLarge(context)
/// Text("Body text").bodyMedium(context)
/// ```
extension TextThemeModifier on Text {
  Text _withTextThemeStyle(BuildContext context, TextStyle? Function(TextTheme) getStyle) {
    final themeStyle = getStyle(Theme.of(context).textTheme);
    final mergedStyle = style != null
        ? themeStyle?.merge(style)
        : themeStyle;

    return Text(
      data ?? '',
      key: key,
      style: mergedStyle,
      textAlign: textAlign,
      textDirection: textDirection,
      locale: locale,
      softWrap: softWrap,
      overflow: overflow,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
      strutStyle: strutStyle,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
      selectionColor: selectionColor,
    );
  }

  /// Applies [TextTheme.displayLarge] style.
  Text displayLarge(BuildContext context) =>
      _withTextThemeStyle(context, (t) => t.displayLarge);

  /// Applies [TextTheme.displayMedium] style.
  Text displayMedium(BuildContext context) =>
      _withTextThemeStyle(context, (t) => t.displayMedium);

  /// Applies [TextTheme.displaySmall] style.
  Text displaySmall(BuildContext context) =>
      _withTextThemeStyle(context, (t) => t.displaySmall);

  /// Applies [TextTheme.headlineLarge] style.
  Text headlineLarge(BuildContext context) =>
      _withTextThemeStyle(context, (t) => t.headlineLarge);

  /// Applies [TextTheme.headlineMedium] style.
  Text headlineMedium(BuildContext context) =>
      _withTextThemeStyle(context, (t) => t.headlineMedium);

  /// Applies [TextTheme.headlineSmall] style.
  Text headlineSmall(BuildContext context) =>
      _withTextThemeStyle(context, (t) => t.headlineSmall);

  /// Applies [TextTheme.titleLarge] style.
  Text titleLarge(BuildContext context) =>
      _withTextThemeStyle(context, (t) => t.titleLarge);

  /// Applies [TextTheme.titleMedium] style.
  Text titleMedium(BuildContext context) =>
      _withTextThemeStyle(context, (t) => t.titleMedium);

  /// Applies [TextTheme.titleSmall] style.
  Text titleSmall(BuildContext context) =>
      _withTextThemeStyle(context, (t) => t.titleSmall);

  /// Applies [TextTheme.bodyLarge] style.
  Text bodyLarge(BuildContext context) =>
      _withTextThemeStyle(context, (t) => t.bodyLarge);

  /// Applies [TextTheme.bodyMedium] style.
  Text bodyMedium(BuildContext context) =>
      _withTextThemeStyle(context, (t) => t.bodyMedium);

  /// Applies [TextTheme.bodySmall] style.
  Text bodySmall(BuildContext context) =>
      _withTextThemeStyle(context, (t) => t.bodySmall);

  /// Applies [TextTheme.labelLarge] style.
  Text labelLarge(BuildContext context) =>
      _withTextThemeStyle(context, (t) => t.labelLarge);

  /// Applies [TextTheme.labelMedium] style.
  Text labelMedium(BuildContext context) =>
      _withTextThemeStyle(context, (t) => t.labelMedium);

  /// Applies [TextTheme.labelSmall] style.
  Text labelSmall(BuildContext context) =>
      _withTextThemeStyle(context, (t) => t.labelSmall);
}
