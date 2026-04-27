import 'package:flutter/material.dart';

/// SwiftUI-style keyboard and focus modifiers.
///
/// Provides chainable methods for keyboard dismissal,
/// focus management, and keyboard-related interactions.
extension FocusModifier on Widget {
  /// Wraps the widget in a [GestureDetector] that dismisses
  /// the keyboard when tapped.
  ///
  /// Commonly used on the root widget of a page.
  ///
  /// ```dart
  /// Scaffold(body: form).dismissKeyboardOnTap()
  /// ```
  Widget dismissKeyboardOnTap() {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      behavior: HitTestBehavior.opaque,
      child: this,
    );
  }

  /// Wraps the widget in a [Focus] widget with [autofocus] enabled.
  ///
  /// ```dart
  /// TextField().autoFocus()
  /// ```
  Widget autoFocus({bool autofocus = true}) {
    return Focus(
      autofocus: autofocus,
      child: this,
    );
  }

  /// Wraps the widget in a [Focus] widget with custom focus
  /// change callbacks.
  ///
  /// ```dart
  /// widget.onFocusChange((hasFocus) {
  ///   if (hasFocus) print("focused!");
  /// })
  /// ```
  Widget onFocusChange(ValueChanged<bool> onFocusChange) {
    return Focus(
      onFocusChange: onFocusChange,
      child: this,
    );
  }

  /// Wraps the widget in a [FocusTraversalGroup] with the
  /// specified traversal policy.
  ///
  /// ```dart
  /// Column(children: fields).focusTraversalGroup()
  /// ```
  Widget focusTraversalGroup({
    FocusTraversalPolicy? policy,
  }) {
    return FocusTraversalGroup(
      policy: policy ?? ReadingOrderTraversalPolicy(),
      child: this,
    );
  }
}
