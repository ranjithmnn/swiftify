import 'package:flutter/material.dart';

/// SwiftUI-style sizing modifiers for any widget.
///
/// Provides chainable methods to control widget dimensions,
/// flex behavior, aspect ratios, and constraints.
extension SizingModifier on Widget {
  /// Wraps the widget in a [SizedBox] with the given dimensions.
  ///
  /// Equivalent to SwiftUI's `.frame(width:height:)`.
  ///
  /// ```dart
  /// Icon(Icons.star).frame(width: 100, height: 100)
  /// ```
  Widget frame({double? width, double? height}) {
    assert(
      width == null || width >= 0,
      'Frame width must be non-negative, got $width.',
    );
    assert(
      height == null || height >= 0,
      'Frame height must be non-negative, got $height.',
    );
    return SizedBox(
      width: width,
      height: height,
      child: this,
    );
  }

  /// Wraps the widget in an [Expanded] widget with the given flex factor.
  ///
  /// Must be used inside a [Row], [Column], or [Flex].
  ///
  /// ```dart
  /// Text("Hello").expanded()
  /// Text("Hello").expanded(flex: 2)
  /// ```
  Widget expanded({int flex = 1}) {
    assert(
      flex > 0,
      'Flex factor must be greater than 0, got $flex.',
    );
    return Expanded(
      flex: flex,
      child: this,
    );
  }

  /// Wraps the widget in a [Flexible] widget with the given flex factor and fit.
  ///
  /// Must be used inside a [Row], [Column], or [Flex].
  ///
  /// ```dart
  /// Text("Hello").flexible()
  /// Text("Hello").flexible(flex: 2, fit: FlexFit.tight)
  /// ```
  Widget flexible({int flex = 1, FlexFit fit = FlexFit.loose}) {
    assert(
      flex > 0,
      'Flex factor must be greater than 0, got $flex.',
    );
    return Flexible(
      flex: flex,
      fit: fit,
      child: this,
    );
  }

  /// Wraps the widget in an [IntrinsicWidth] widget.
  ///
  /// Sizes the child to its intrinsic width. Useful when you need
  /// a widget to be as wide as its content.
  ///
  /// ```dart
  /// Column(children: [...]).intrinsicWidth()
  /// ```
  Widget intrinsicWidth({double? stepWidth, double? stepHeight}) {
    return IntrinsicWidth(
      stepWidth: stepWidth,
      stepHeight: stepHeight,
      child: this,
    );
  }

  /// Wraps the widget in an [IntrinsicHeight] widget.
  ///
  /// Sizes the child to its intrinsic height. Useful when you need
  /// a widget to be as tall as its content.
  ///
  /// ```dart
  /// Row(children: [...]).intrinsicHeight()
  /// ```
  Widget intrinsicHeight() {
    return IntrinsicHeight(
      child: this,
    );
  }

  /// Wraps the widget in an [AspectRatio] widget.
  ///
  /// ```dart
  /// Image.asset('photo.png').aspectRatio(16 / 9)
  /// ```
  Widget aspectRatio(double ratio) {
    assert(
      ratio > 0,
      'Aspect ratio must be greater than 0, got $ratio.',
    );
    return AspectRatio(
      aspectRatio: ratio,
      child: this,
    );
  }

  /// Wraps the widget in a [FittedBox] with the given [BoxFit].
  ///
  /// Scales and positions the child within the parent according
  /// to the given fit.
  ///
  /// ```dart
  /// Text("Hello").fittedBox(fit: BoxFit.scaleDown)
  /// ```
  Widget fittedBox({BoxFit fit = BoxFit.contain, AlignmentGeometry alignment = Alignment.center}) {
    return FittedBox(
      fit: fit,
      alignment: alignment,
      child: this,
    );
  }

  /// Wraps the widget in a [ConstrainedBox] with the given constraints.
  ///
  /// ```dart
  /// widget.constrainedBox(maxWidth: 300, minHeight: 50)
  /// ```
  Widget constrainedBox({
    double minWidth = 0.0,
    double maxWidth = double.infinity,
    double minHeight = 0.0,
    double maxHeight = double.infinity,
  }) {
    assert(
      minWidth >= 0,
      'minWidth must be non-negative, got $minWidth.',
    );
    assert(
      minHeight >= 0,
      'minHeight must be non-negative, got $minHeight.',
    );
    assert(
      minWidth <= maxWidth,
      'minWidth ($minWidth) must be less than or equal to maxWidth ($maxWidth).',
    );
    assert(
      minHeight <= maxHeight,
      'minHeight ($minHeight) must be less than or equal to maxHeight ($maxHeight).',
    );
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: minWidth,
        maxWidth: maxWidth,
        minHeight: minHeight,
        maxHeight: maxHeight,
      ),
      child: this,
    );
  }

  /// Wraps the widget in an [UnconstrainedBox].
  ///
  /// Removes any constraints imposed by the parent, allowing
  /// the child to render at its natural size.
  ///
  /// ```dart
  /// widget.unconstrained()
  /// ```
  Widget unconstrained({
    Axis? constrainedAxis,
    AlignmentGeometry alignment = Alignment.center,
  }) {
    return UnconstrainedBox(
      constrainedAxis: constrainedAxis,
      alignment: alignment,
      child: this,
    );
  }

  /// Wraps the widget in a [LimitedBox] with the given max dimensions.
  ///
  /// Useful for limiting the size of a widget when it has
  /// unbounded constraints (e.g., inside a [ListView]).
  ///
  /// ```dart
  /// widget.limitedBox(maxWidth: 200, maxHeight: 300)
  /// ```
  Widget limitedBox({
    double maxWidth = double.infinity,
    double maxHeight = double.infinity,
  }) {
    assert(
      maxWidth >= 0,
      'maxWidth must be non-negative, got $maxWidth.',
    );
    assert(
      maxHeight >= 0,
      'maxHeight must be non-negative, got $maxHeight.',
    );
    return LimitedBox(
      maxWidth: maxWidth,
      maxHeight: maxHeight,
      child: this,
    );
  }
}
