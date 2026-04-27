import 'package:flutter/material.dart';

/// SwiftUI-style overlay and stack composition modifiers.
///
/// Provides chainable methods to overlay widgets on top of
/// or behind the current widget using [Stack].
extension OverlayModifier on Widget {
  /// Places a child widget on top of this widget using a [Stack].
  ///
  /// ```dart
  /// Image.asset('product.png')
  ///     .overlay(
  ///       child: Icon(Icons.favorite, color: Colors.red),
  ///       alignment: Alignment.topRight,
  ///     )
  /// ```
  Widget overlay({
    required Widget child,
    AlignmentGeometry alignment = Alignment.center,
    StackFit fit = StackFit.loose,
    Clip clipBehavior = Clip.hardEdge,
  }) {
    return Stack(
      alignment: alignment,
      fit: fit,
      clipBehavior: clipBehavior,
      children: [
        this,
        child,
      ],
    );
  }

  /// Places a child widget behind this widget using a [Stack].
  ///
  /// ```dart
  /// Text("Hello")
  ///     .stackBackground(
  ///       child: Container(color: Colors.blue.withOpacity(0.3)),
  ///     )
  /// ```
  Widget stackBackground({
    required Widget child,
    AlignmentGeometry alignment = Alignment.center,
    StackFit fit = StackFit.loose,
    Clip clipBehavior = Clip.hardEdge,
  }) {
    return Stack(
      alignment: alignment,
      fit: fit,
      clipBehavior: clipBehavior,
      children: [
        child,
        this,
      ],
    );
  }

  /// Adds a badge-style overlay positioned at a corner.
  ///
  /// ```dart
  /// Icon(Icons.shopping_cart)
  ///     .badge(
  ///       child: Text("3"),
  ///       backgroundColor: Colors.red,
  ///     )
  /// ```
  Widget badge({
    required Widget child,
    Color backgroundColor = Colors.red,
    double size = 20.0,
    AlignmentGeometry alignment = Alignment.topRight,
    EdgeInsetsGeometry padding = const EdgeInsets.all(2),
  }) {
    assert(
      size > 0,
      'Badge size must be greater than 0, got $size.',
    );
    return Stack(
      clipBehavior: Clip.none,
      children: [
        this,
        Positioned(
          top: -size / 4,
          right: alignment == Alignment.topRight ? -size / 4 : null,
          left: alignment == Alignment.topLeft ? -size / 4 : null,
          child: Container(
            constraints: BoxConstraints(
              minWidth: size,
              minHeight: size,
            ),
            padding: padding,
            decoration: BoxDecoration(
              color: backgroundColor,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: child,
          ),
        ),
      ],
    );
  }
}
