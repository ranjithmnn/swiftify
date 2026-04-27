import 'package:flutter/material.dart';

/// SwiftUI-style alignment modifiers for any widget.
///
/// Provides chainable methods to control widget alignment
/// and positioning within parent layouts.
extension AlignmentModifier on Widget {
  /// Wraps the widget in an [Align] widget with the given alignment.
  ///
  /// ```dart
  /// Text("Top Left").align(Alignment.topLeft)
  /// Icon(Icons.star).align(Alignment.bottomRight)
  /// ```
  Widget align(AlignmentGeometry alignment) {
    return Align(
      alignment: alignment,
      child: this,
    );
  }

  /// Wraps the widget in a [Positioned] widget for use inside a [Stack].
  ///
  /// At least one positional parameter must be provided.
  ///
  /// ```dart
  /// widget.positioned(top: 10, left: 20)
  /// widget.positioned(bottom: 0, right: 0)
  /// ```
  Widget positioned({
    double? top,
    double? bottom,
    double? left,
    double? right,
    double? width,
    double? height,
  }) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      width: width,
      height: height,
      child: this,
    );
  }

  /// Wraps the widget in a [Positioned.fill] for use inside a [Stack].
  ///
  /// The widget will fill the entire stack with optional insets.
  ///
  /// ```dart
  /// widget.positionedFill()
  /// widget.positionedFill(top: 10, bottom: 10)
  /// ```
  Widget positionedFill({
    double? top = 0.0,
    double? bottom = 0.0,
    double? left = 0.0,
    double? right = 0.0,
  }) {
    return Positioned.fill(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: this,
    );
  }

  /// Convenience for centering at the start (left in LTR).
  ///
  /// ```dart
  /// Text("Left aligned").centerLeft()
  /// ```
  Widget centerLeft() {
    return Align(
      alignment: Alignment.centerLeft,
      child: this,
    );
  }

  /// Convenience for centering at the end (right in LTR).
  ///
  /// ```dart
  /// Text("Right aligned").centerRight()
  /// ```
  Widget centerRight() {
    return Align(
      alignment: Alignment.centerRight,
      child: this,
    );
  }
}
