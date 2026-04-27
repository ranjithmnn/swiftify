import 'package:flutter/material.dart';

/// SwiftUI-style visibility and interaction modifiers for any widget.
///
/// Provides chainable methods to control opacity, visibility,
/// and pointer interaction behavior.
extension VisibilityModifier on Widget {
  /// Wraps the widget in an [Opacity] widget.
  ///
  /// The [value] must be between 0.0 (fully transparent) and
  /// 1.0 (fully opaque).
  ///
  /// ```dart
  /// Text("Faded").opacity(0.5)
  /// ```
  Widget opacity(double value) {
    assert(value >= 0.0 && value <= 1.0,
        'Opacity must be between 0.0 and 1.0, got $value');
    return Opacity(
      opacity: value,
      child: this,
    );
  }

  /// Wraps the widget in a [Visibility] widget.
  ///
  /// When [isVisible] is false, the widget is hidden but can
  /// optionally maintain its layout space via [maintainSize].
  ///
  /// ```dart
  /// Text("Toggle me").visible(showText)
  /// Text("Keep space").visible(false, maintainSize: true)
  /// ```
  Widget visible(
    bool isVisible, {
    bool maintainSize = false,
    bool maintainAnimation = false,
    bool maintainState = false,
    bool maintainInteractivity = false,
    Widget replacement = const SizedBox.shrink(),
  }) {
    return Visibility(
      visible: isVisible,
      maintainSize: maintainSize,
      maintainAnimation: maintainSize ? true : maintainAnimation,
      maintainState: maintainSize ? true : maintainState,
      maintainInteractivity: maintainSize ? false : maintainInteractivity,
      replacement: replacement,
      child: this,
    );
  }

  /// Wraps the widget in an [Offstage] widget.
  ///
  /// When [offstage] is true, the widget is not laid out, not painted,
  /// and does not take up space — but it remains in the widget tree.
  ///
  /// ```dart
  /// widget.offstage(true)
  /// ```
  Widget offstage([bool offstage = true]) {
    return Offstage(
      offstage: offstage,
      child: this,
    );
  }

  /// Wraps the widget in an [IgnorePointer] widget.
  ///
  /// When [ignoring] is true, all pointer events pass through
  /// this widget to the widgets below it.
  ///
  /// ```dart
  /// button.ignorePointer(ignoring: isLoading)
  /// ```
  Widget ignorePointer({bool ignoring = true}) {
    return IgnorePointer(
      ignoring: ignoring,
      child: this,
    );
  }

  /// Wraps the widget in an [AbsorbPointer] widget.
  ///
  /// When [absorbing] is true, pointer events are absorbed
  /// and do not reach any widgets below.
  ///
  /// ```dart
  /// widget.absorbPointer(absorbing: true)
  /// ```
  Widget absorbPointer({bool absorbing = true}) {
    return AbsorbPointer(
      absorbing: absorbing,
      child: this,
    );
  }
}
