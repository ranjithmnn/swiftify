import 'package:flutter/material.dart';

/// SwiftUI-style semantics and accessibility modifiers for any widget.
///
/// Provides chainable methods to add tooltips, semantic labels,
/// and control accessibility tree behavior.
extension SemanticsModifier on Widget {
  /// Wraps the widget in a [Tooltip] widget.
  ///
  /// Shows a tooltip when the user long-presses or hovers
  /// over the widget.
  ///
  /// ```dart
  /// IconButton(icon: Icon(Icons.info), onPressed: () {})
  ///     .tooltip('More information')
  /// ```
  Widget tooltip(
    String message, {
    Decoration? decoration,
    TextStyle? textStyle,
    Duration? waitDuration,
    Duration? showDuration,
    bool? preferBelow,
    double? verticalOffset,
  }) {
    assert(
      message.isNotEmpty,
      'Tooltip message must not be empty. Provide a descriptive message for the tooltip.',
    );
    return Tooltip(
      message: message,
      decoration: decoration,
      textStyle: textStyle,
      waitDuration: waitDuration,
      showDuration: showDuration,
      preferBelow: preferBelow,
      verticalOffset: verticalOffset,
      child: this,
    );
  }

  /// Wraps the widget in a [Semantics] widget with a label.
  ///
  /// Provides a textual description for accessibility tools
  /// like screen readers.
  ///
  /// ```dart
  /// Image.asset('profile.png').semanticLabel('User profile photo')
  /// ```
  Widget semanticLabel(
    String label, {
    bool? enabled,
    bool? checked,
    bool? selected,
    bool? button,
    bool? header,
    bool? textField,
    bool? readOnly,
    bool? focusable,
    bool? focused,
    String? hint,
    String? value,
  }) {
    assert(
      label.isNotEmpty,
      'Semantic label must not be empty. Provide a descriptive label for accessibility.',
    );
    return Semantics(
      label: label,
      enabled: enabled,
      checked: checked,
      selected: selected,
      button: button,
      header: header,
      textField: textField,
      readOnly: readOnly,
      focusable: focusable,
      focused: focused,
      hint: hint,
      value: value,
      child: this,
    );
  }

  /// Wraps the widget in an [ExcludeSemantics] widget.
  ///
  /// Hides the widget and its subtree from the accessibility tree.
  ///
  /// ```dart
  /// decorativeImage.excludeSemantics()
  /// ```
  Widget excludeSemantics({bool excluding = true}) {
    return ExcludeSemantics(
      excluding: excluding,
      child: this,
    );
  }

  /// Wraps the widget in a [MergeSemantics] widget.
  ///
  /// Merges the semantics of all descendant widgets into
  /// a single semantic node.
  ///
  /// ```dart
  /// Row(children: [Icon(Icons.star), Text("Favorite")])
  ///     .mergeSemantics()
  /// ```
  Widget mergeSemantics() {
    return MergeSemantics(
      child: this,
    );
  }
}
