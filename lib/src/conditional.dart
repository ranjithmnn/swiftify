import 'package:flutter/material.dart';

/// Conditional and compositional modifiers for any widget.
///
/// Provides chainable methods for conditional widget wrapping,
/// enabling clean, readable conditional UI logic without
/// breaking the modifier chain.
extension ConditionalModifier on Widget {
  /// Applies a modifier only when [condition] is true.
  ///
  /// Returns the widget unmodified when [condition] is false.
  ///
  /// ```dart
  /// Text("Hello")
  ///     .applyIf(isHighlighted, (w) => w.backgroundColor(Colors.yellow))
  ///     .applyIf(isBold, (w) => w.bold())
  /// ```
  Widget applyIf(bool condition, Widget Function(Widget widget) modifier) {
    return condition ? modifier(this) : this;
  }

  /// Applies a modifier only when [condition] is false.
  ///
  /// The inverse of [applyIf].
  ///
  /// ```dart
  /// button.applyUnless(isEnabled, (w) => w.opacity(0.5))
  /// ```
  Widget applyUnless(bool condition, Widget Function(Widget widget) modifier) {
    return condition ? this : modifier(this);
  }

  /// Transforms the widget through a function.
  ///
  /// Useful for applying complex transformations inline
  /// without breaking the modifier chain.
  ///
  /// ```dart
  /// widget.let((w) => MyCustomWrapper(child: w))
  /// ```
  Widget let(Widget Function(Widget widget) transform) {
    return transform(this);
  }

  /// Wraps the widget with a builder function that has access
  /// to [BuildContext].
  ///
  /// Useful when you need context-dependent modifications
  /// inline in a modifier chain.
  ///
  /// ```dart
  /// widget.withBuilder((context, child) {
  ///   final isDark = Theme.of(context).brightness == Brightness.dark;
  ///   return isDark ? child.opacity(0.8) : child;
  /// })
  /// ```
  Widget withBuilder(Widget Function(BuildContext context, Widget child) builder) {
    return Builder(
      builder: (context) => builder(context, this),
    );
  }

  /// Applies one of two modifiers based on a condition.
  ///
  /// ```dart
  /// widget.when(
  ///   isLoggedIn,
  ///   ifTrue: (w) => w.padding(),
  ///   ifFalse: (w) => w.opacity(0.5),
  /// )
  /// ```
  Widget when(
    bool condition, {
    required Widget Function(Widget widget) ifTrue,
    required Widget Function(Widget widget) ifFalse,
  }) {
    return condition ? ifTrue(this) : ifFalse(this);
  }
}
