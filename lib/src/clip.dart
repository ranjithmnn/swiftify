import 'package:flutter/material.dart';

/// SwiftUI-style clip modifiers for any widget.
///
/// Provides chainable methods to clip widgets into
/// various shapes like ovals, rectangles, and custom paths.
extension ClipModifier on Widget {
  /// Clips the widget to an oval (ellipse) shape.
  ///
  /// ```dart
  /// Image.asset('avatar.png').clipOval()
  /// ```
  Widget clipOval({CustomClipper<Rect>? clipper, Clip clipBehavior = Clip.antiAlias}) {
    return ClipOval(
      clipper: clipper,
      clipBehavior: clipBehavior,
      child: this,
    );
  }

  /// Clips the widget to a rectangle.
  ///
  /// Optionally provide a custom clipper for more control.
  ///
  /// ```dart
  /// widget.clipRect()
  /// ```
  Widget clipRect({CustomClipper<Rect>? clipper, Clip clipBehavior = Clip.hardEdge}) {
    return ClipRect(
      clipper: clipper,
      clipBehavior: clipBehavior,
      child: this,
    );
  }

  /// Clips the widget using a custom path.
  ///
  /// ```dart
  /// widget.clipPath(clipper: MyCustomClipper())
  /// ```
  Widget clipPath({required CustomClipper<Path> clipper, Clip clipBehavior = Clip.antiAlias}) {
    return ClipPath(
      clipper: clipper,
      clipBehavior: clipBehavior,
      child: this,
    );
  }

  /// Convenience method to clip the widget into a circle.
  ///
  /// This is equivalent to `.clipOval()` and is provided
  /// for improved readability.
  ///
  /// ```dart
  /// Image.network(url).clipCircle()
  /// ```
  Widget clipCircle() {
    return ClipOval(
      clipBehavior: Clip.antiAlias,
      child: this,
    );
  }

  /// Clips the widget to a rounded rectangle.
  ///
  /// ```dart
  /// widget.clipRoundedRect(radius: 16)
  /// ```
  Widget clipRoundedRect({
    double radius = 12.0,
    BorderRadius? borderRadius,
    Clip clipBehavior = Clip.antiAlias,
  }) {
    assert(
      radius >= 0,
      'Clip radius must be non-negative, got $radius.',
    );
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(radius),
      clipBehavior: clipBehavior,
      child: this,
    );
  }
}
