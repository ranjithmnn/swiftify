import 'package:flutter/material.dart';

/// SwiftUI-style animation modifiers for any widget.
///
/// Provides chainable methods for hero transitions,
/// animated switching, and animated visibility.
extension AnimationModifier on Widget {
  /// Wraps the widget in a [Hero] widget for shared
  /// element transitions between routes.
  ///
  /// ```dart
  /// Image.asset('photo.png').hero(tag: 'photo-1')
  /// ```
  Widget hero({
    required Object tag,
    CreateRectTween? createRectTween,
    HeroFlightShuttleBuilder? flightShuttleBuilder,
    bool transitionOnUserGestures = false,
  }) {
    return Hero(
      tag: tag,
      createRectTween: createRectTween,
      flightShuttleBuilder: flightShuttleBuilder,
      transitionOnUserGestures: transitionOnUserGestures,
      child: this,
    );
  }

  /// Wraps the widget in an [AnimatedSwitcher].
  ///
  /// Automatically animates between old and new child widgets.
  /// Use a unique [Key] on the child to trigger the transition.
  ///
  /// ```dart
  /// Text(count.toString(), key: ValueKey(count))
  ///     .animatedSwitcher()
  /// ```
  Widget animatedSwitcher({
    Duration duration = const Duration(milliseconds: 300),
    Duration? reverseDuration,
    Curve switchInCurve = Curves.linear,
    Curve switchOutCurve = Curves.linear,
    AnimatedSwitcherTransitionBuilder transitionBuilder =
        AnimatedSwitcher.defaultTransitionBuilder,
    AnimatedSwitcherLayoutBuilder layoutBuilder =
        AnimatedSwitcher.defaultLayoutBuilder,
  }) {
    assert(
      duration > Duration.zero,
      'Duration must be greater than zero.',
    );
    return AnimatedSwitcher(
      duration: duration,
      reverseDuration: reverseDuration,
      switchInCurve: switchInCurve,
      switchOutCurve: switchOutCurve,
      transitionBuilder: transitionBuilder,
      layoutBuilder: layoutBuilder,
      child: this,
    );
  }

  /// Wraps the widget in an [AnimatedOpacity] widget.
  ///
  /// Animates opacity changes smoothly.
  ///
  /// ```dart
  /// widget.animatedOpacity(
  ///   opacity: isVisible ? 1.0 : 0.0,
  ///   duration: Duration(milliseconds: 300),
  /// )
  /// ```
  Widget animatedOpacity({
    required double opacity,
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.linear,
    VoidCallback? onEnd,
  }) {
    assert(
      opacity >= 0.0 && opacity <= 1.0,
      'Opacity must be between 0.0 and 1.0, got $opacity.',
    );
    assert(
      duration > Duration.zero,
      'Duration must be greater than zero.',
    );
    return AnimatedOpacity(
      opacity: opacity,
      duration: duration,
      curve: curve,
      onEnd: onEnd,
      child: this,
    );
  }

  /// Wraps the widget in an [AnimatedScale] widget.
  ///
  /// Animates scale changes smoothly.
  ///
  /// ```dart
  /// widget.animatedScale(
  ///   scale: isSelected ? 1.2 : 1.0,
  /// )
  /// ```
  Widget animatedScale({
    required double scale,
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.linear,
    Alignment alignment = Alignment.center,
    VoidCallback? onEnd,
  }) {
    assert(
      scale >= 0,
      'Scale must be non-negative, got $scale.',
    );
    assert(
      duration > Duration.zero,
      'Duration must be greater than zero.',
    );
    return AnimatedScale(
      scale: scale,
      duration: duration,
      curve: curve,
      alignment: alignment,
      onEnd: onEnd,
      child: this,
    );
  }

  /// Wraps the widget in an [AnimatedSlide] widget.
  ///
  /// Animates position changes smoothly.
  ///
  /// ```dart
  /// widget.animatedSlide(
  ///   offset: isVisible ? Offset.zero : Offset(0, 1),
  /// )
  /// ```
  Widget animatedSlide({
    required Offset offset,
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.linear,
    VoidCallback? onEnd,
  }) {
    assert(
      duration > Duration.zero,
      'Duration must be greater than zero.',
    );
    return AnimatedSlide(
      offset: offset,
      duration: duration,
      curve: curve,
      onEnd: onEnd,
      child: this,
    );
  }

  /// Wraps the widget in an [AnimatedRotation] widget.
  ///
  /// Animates rotation changes. The [turns] value represents
  /// full rotations (1.0 = 360°).
  ///
  /// ```dart
  /// Icon(Icons.refresh).animatedRotation(turns: isLoading ? 1.0 : 0.0)
  /// ```
  Widget animatedRotation({
    required double turns,
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.linear,
    Alignment alignment = Alignment.center,
    VoidCallback? onEnd,
  }) {
    assert(
      duration > Duration.zero,
      'Duration must be greater than zero.',
    );
    return AnimatedRotation(
      turns: turns,
      duration: duration,
      curve: curve,
      alignment: alignment,
      onEnd: onEnd,
      child: this,
    );
  }

  /// Wraps the widget in an [AnimatedContainer].
  ///
  /// Animates changes to container properties like padding,
  /// margin, decoration, and constraints.
  ///
  /// ```dart
  /// widget.animatedContainer(
  ///   duration: Duration(milliseconds: 300),
  ///   padding: EdgeInsets.all(isExpanded ? 24 : 8),
  ///   decoration: BoxDecoration(color: isActive ? Colors.blue : Colors.grey),
  /// )
  /// ```
  Widget animatedContainer({
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.linear,
    AlignmentGeometry? alignment,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    Decoration? decoration,
    Decoration? foregroundDecoration,
    BoxConstraints? constraints,
    double? width,
    double? height,
    Color? color,
    Matrix4? transform,
    AlignmentGeometry? transformAlignment,
    Clip clipBehavior = Clip.none,
    VoidCallback? onEnd,
  }) {
    assert(
      duration > Duration.zero,
      'Duration must be greater than zero.',
    );
    assert(
      decoration == null || color == null,
      'Cannot provide both a decoration and a color. Use decoration with a BoxDecoration that includes the color instead.',
    );
    return AnimatedContainer(
      duration: duration,
      curve: curve,
      alignment: alignment,
      padding: padding,
      margin: margin,
      decoration: decoration,
      foregroundDecoration: foregroundDecoration,
      constraints: constraints,
      width: width,
      height: height,
      color: decoration == null ? color : null,
      transform: transform,
      transformAlignment: transformAlignment,
      clipBehavior: clipBehavior,
      onEnd: onEnd,
      child: this,
    );
  }

  /// Wraps the widget in an [AnimatedPadding] widget.
  ///
  /// Animates padding changes smoothly.
  ///
  /// ```dart
  /// widget.animatedPadding(
  ///   padding: EdgeInsets.all(isExpanded ? 32 : 8),
  /// )
  /// ```
  Widget animatedPadding({
    required EdgeInsetsGeometry padding,
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.linear,
    VoidCallback? onEnd,
  }) {
    assert(
      duration > Duration.zero,
      'Duration must be greater than zero.',
    );
    return AnimatedPadding(
      padding: padding,
      duration: duration,
      curve: curve,
      onEnd: onEnd,
      child: this,
    );
  }
}
