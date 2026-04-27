import 'package:flutter/material.dart';

/// SwiftUI-style scroll modifiers for any widget.
///
/// Provides chainable methods to make widgets scrollable
/// and add scrollbar indicators.
extension ScrollModifier on Widget {
  /// Wraps the widget in a [SingleChildScrollView].
  ///
  /// Makes the widget scrollable in the given [direction].
  ///
  /// ```dart
  /// Column(children: [...]).scrollable()
  /// Row(children: [...]).scrollable(direction: Axis.horizontal)
  /// ```
  Widget scrollable({
    Axis direction = Axis.vertical,
    bool reverse = false,
    ScrollPhysics? physics,
    EdgeInsetsGeometry? padding,
    ScrollController? controller,
    Clip clipBehavior = Clip.hardEdge,
  }) {
    return SingleChildScrollView(
      scrollDirection: direction,
      reverse: reverse,
      physics: physics,
      padding: padding,
      controller: controller,
      clipBehavior: clipBehavior,
      child: this,
    );
  }

  /// Wraps the widget in a [Scrollbar].
  ///
  /// Adds a scrollbar indicator overlay to the widget.
  /// The child should typically be a scrollable widget.
  ///
  /// ```dart
  /// ListView(...).scrollbar()
  /// Column(...).scrollable().scrollbar()
  /// ```
  Widget scrollbar({
    ScrollController? controller,
    bool? thumbVisibility,
    bool? trackVisibility,
    double? thickness,
    Radius? radius,
    ScrollNotificationPredicate? notificationPredicate,
  }) {
    return Scrollbar(
      controller: controller,
      thumbVisibility: thumbVisibility,
      trackVisibility: trackVisibility,
      thickness: thickness,
      radius: radius,
      notificationPredicate:
          notificationPredicate ?? defaultScrollNotificationPredicate,
      child: this,
    );
  }
}
