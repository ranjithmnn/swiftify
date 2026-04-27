import 'package:flutter/material.dart';

/// Material Design widget modifiers.
///
/// Provides chainable methods to wrap widgets with
/// Material components like [Card], [Material], and [InkWell].
extension MaterialModifier on Widget {
  /// Wraps the widget in a [Card] widget.
  ///
  /// ```dart
  /// ListTile(title: Text("Item")).card(elevation: 4)
  /// ```
  Widget card({
    Color? color,
    Color? shadowColor,
    Color? surfaceTintColor,
    double? elevation,
    ShapeBorder? shape,
    EdgeInsetsGeometry? margin,
    Clip? clipBehavior,
    bool borderOnForeground = true,
  }) {
    assert(
      elevation == null || elevation >= 0,
      'Card elevation must be non-negative, got $elevation.',
    );
    return Card(
      color: color,
      shadowColor: shadowColor,
      surfaceTintColor: surfaceTintColor,
      elevation: elevation,
      shape: shape,
      margin: margin,
      clipBehavior: clipBehavior,
      borderOnForeground: borderOnForeground,
      child: this,
    );
  }

  /// Wraps the widget in a [Material] widget.
  ///
  /// Useful for providing ink splash effects or elevation
  /// to non-Material widgets.
  ///
  /// ```dart
  /// widget.material(elevation: 4, color: Colors.white)
  /// ```
  Widget material({
    MaterialType type = MaterialType.canvas,
    double elevation = 0.0,
    Color? color,
    Color? shadowColor,
    Color? surfaceTintColor,
    ShapeBorder? shape,
    BorderRadiusGeometry? borderRadius,
    Clip clipBehavior = Clip.none,
  }) {
    assert(
      elevation >= 0,
      'Material elevation must be non-negative, got $elevation.',
    );
    assert(
      shape == null || borderRadius == null,
      'Cannot specify both "shape" and "borderRadius".',
    );
    return Material(
      type: type,
      elevation: elevation,
      color: color,
      shadowColor: shadowColor,
      surfaceTintColor: surfaceTintColor,
      shape: shape,
      borderRadius: borderRadius,
      clipBehavior: clipBehavior,
      child: this,
    );
  }

  /// Wraps the widget in an [InkWell] for Material ripple effects.
  ///
  /// ```dart
  /// widget.inkWell(
  ///   onTap: () => print("tapped"),
  ///   borderRadius: BorderRadius.circular(12),
  /// )
  /// ```
  Widget inkWell({
    VoidCallback? onTap,
    VoidCallback? onDoubleTap,
    VoidCallback? onLongPress,
    Color? splashColor,
    Color? highlightColor,
    Color? hoverColor,
    Color? focusColor,
    BorderRadius? borderRadius,
    ShapeBorder? customBorder,
    bool enableFeedback = true,
    bool excludeFromSemantics = false,
  }) {
    return InkWell(
      onTap: onTap,
      onDoubleTap: onDoubleTap,
      onLongPress: onLongPress,
      splashColor: splashColor,
      highlightColor: highlightColor,
      hoverColor: hoverColor,
      focusColor: focusColor,
      borderRadius: borderRadius,
      customBorder: customBorder,
      enableFeedback: enableFeedback,
      excludeFromSemantics: excludeFromSemantics,
      child: this,
    );
  }
}
