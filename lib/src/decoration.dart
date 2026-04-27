import 'package:flutter/material.dart';

/// SwiftUI-style decoration modifiers for any widget.
///
/// Provides chainable methods to add shadows, borders,
/// gradients, and shapes to widgets.
extension DecorationModifier on Widget {
  /// Adds a box shadow to the widget.
  ///
  /// Wraps the widget in a [DecoratedBox] with a [BoxShadow].
  ///
  /// ```dart
  /// widget.shadow(
  ///   color: Colors.black26,
  ///   blurRadius: 10,
  ///   offset: Offset(0, 4),
  /// )
  /// ```
  Widget shadow({
    Color color = const Color(0x33000000),
    double blurRadius = 10.0,
    double spreadRadius = 0.0,
    Offset offset = Offset.zero,
    BorderRadiusGeometry? borderRadius,
  }) {
    assert(
      blurRadius >= 0,
      'blurRadius must be non-negative, got $blurRadius.',
    );
    assert(
      spreadRadius >= 0,
      'spreadRadius must be non-negative, got $spreadRadius.',
    );
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        boxShadow: [
          BoxShadow(
            color: color,
            blurRadius: blurRadius,
            spreadRadius: spreadRadius,
            offset: offset,
          ),
        ],
      ),
      child: this,
    );
  }

  /// Adds a border around the widget.
  ///
  /// ```dart
  /// widget.border(color: Colors.grey, width: 1)
  /// widget.border(color: Colors.blue, width: 2, radius: 12)
  /// ```
  Widget border({
    Color color = const Color(0xFF000000),
    double width = 1.0,
    BorderStyle style = BorderStyle.solid,
    double? radius,
  }) {
    assert(
      width > 0,
      'Border width must be greater than 0, got $width.',
    );
    assert(
      radius == null || radius >= 0,
      'Border radius must be non-negative, got $radius.',
    );
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: color,
          width: width,
          style: style,
        ),
        borderRadius: radius != null ? BorderRadius.circular(radius) : null,
      ),
      child: this,
    );
  }

  /// Applies a gradient background to the widget.
  ///
  /// ```dart
  /// widget.gradient(
  ///   LinearGradient(
  ///     colors: [Colors.blue, Colors.purple],
  ///   ),
  /// )
  /// ```
  Widget gradient(
    Gradient gradient, {
    BorderRadiusGeometry? borderRadius,
  }) {
    return Container(
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: borderRadius,
      ),
      child: this,
    );
  }

  /// Applies a box shape to the widget's decoration.
  ///
  /// ```dart
  /// Image.asset('avatar.png').shape(BoxShape.circle)
  /// ```
  Widget shape(
    BoxShape boxShape, {
    Color? color,
  }) {
    return Container(
      decoration: BoxDecoration(
        shape: boxShape,
        color: color,
      ),
      child: this,
    );
  }

  /// Applies a full [BoxDecoration] to the widget.
  ///
  /// This is a convenience wrapper when you need full
  /// control over the decoration.
  ///
  /// ```dart
  /// widget.decorated(
  ///   BoxDecoration(
  ///     color: Colors.white,
  ///     borderRadius: BorderRadius.circular(12),
  ///     boxShadow: [BoxShadow(blurRadius: 8)],
  ///   ),
  /// )
  /// ```
  Widget decorated(BoxDecoration decoration) {
    return DecoratedBox(
      decoration: decoration,
      child: this,
    );
  }

  /// Adds a foreground decoration overlay to the widget.
  ///
  /// ```dart
  /// widget.foregroundDecoration(
  ///   BoxDecoration(
  ///     color: Colors.black.withOpacity(0.3),
  ///   ),
  /// )
  /// ```
  Widget foregroundDecoration(Decoration decoration) {
    return DecoratedBox(
      decoration: decoration,
      position: DecorationPosition.foreground,
      child: this,
    );
  }
}
