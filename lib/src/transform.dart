import 'dart:math' as math;

import 'package:flutter/material.dart';

/// SwiftUI-style transform modifiers for any widget.
///
/// Provides chainable methods for rotation, scaling,
/// translation, and flipping widgets.
extension TransformModifier on Widget {
  /// Rotates the widget by the given [angle] in radians.
  ///
  /// ```dart
  /// Icon(Icons.refresh).rotate(angle: math.pi / 4)
  /// ```
  Widget rotate({
    required double angle,
    AlignmentGeometry alignment = Alignment.center,
    Offset? origin,
  }) {
    return Transform.rotate(
      angle: angle,
      alignment: alignment,
      origin: origin,
      child: this,
    );
  }

  /// Rotates the widget by the given [degrees].
  ///
  /// A convenience method that converts degrees to radians.
  ///
  /// ```dart
  /// Icon(Icons.arrow_forward).rotateDegrees(45)
  /// ```
  Widget rotateDegrees(
    double degrees, {
    AlignmentGeometry alignment = Alignment.center,
    Offset? origin,
  }) {
    return Transform.rotate(
      angle: degrees * (math.pi / 180),
      alignment: alignment,
      origin: origin,
      child: this,
    );
  }

  /// Scales the widget uniformly or along individual axes.
  ///
  /// ```dart
  /// widget.scale(all: 1.5)
  /// widget.scale(scaleX: 2.0, scaleY: 0.5)
  /// ```
  Widget scale({
    double? all,
    double? scaleX,
    double? scaleY,
    AlignmentGeometry alignment = Alignment.center,
    Offset? origin,
  }) {
    assert(
      all != null || scaleX != null || scaleY != null,
      'At least one of "all", "scaleX", or "scaleY" must be provided.',
    );
    assert(
      all == null || (scaleX == null && scaleY == null),
      'Cannot specify both "all" and individual axis scales ("scaleX"/"scaleY"). Use either "all" for uniform scaling or "scaleX"/"scaleY" for per-axis scaling.',
    );
    return Transform.scale(
      scale: all,
      scaleX: all == null ? scaleX : null,
      scaleY: all == null ? scaleY : null,
      alignment: alignment,
      origin: origin,
      child: this,
    );
  }

  /// Translates (moves) the widget by the given [offset].
  ///
  /// ```dart
  /// widget.translate(offset: Offset(10, 20))
  /// ```
  Widget translate({
    required Offset offset,
    bool transformHitTests = true,
  }) {
    return Transform.translate(
      offset: offset,
      transformHitTests: transformHitTests,
      child: this,
    );
  }

  /// Flips the widget horizontally and/or vertically.
  ///
  /// ```dart
  /// Icon(Icons.arrow_back).flip(flipX: true)   // mirrors horizontally
  /// widget.flip(flipY: true)                     // mirrors vertically
  /// ```
  Widget flip({
    bool flipX = false,
    bool flipY = false,
    AlignmentGeometry alignment = Alignment.center,
  }) {
    assert(
      flipX || flipY,
      'At least one of "flipX" or "flipY" must be true. Use ".flip(flipX: true)" to mirror horizontally or ".flip(flipY: true)" to mirror vertically.',
    );
    return Transform(
      alignment: alignment,
      transform: Matrix4.diagonal3Values(
        flipX ? -1.0 : 1.0,
        flipY ? -1.0 : 1.0,
        1.0,
      ),
      child: this,
    );
  }
}
