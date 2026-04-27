import 'package:flutter/material.dart';

/// SwiftUI-style navigation modifiers for any widget.
///
/// Provides chainable methods for push navigation,
/// dialogs, and bottom sheets triggered by gestures.
extension NavigationModifier on Widget {
  /// Wraps the widget in a [GestureDetector] that navigates
  /// to the given [page] on tap.
  ///
  /// ```dart
  /// ListTile(title: Text("Settings"))
  ///     .onTapNavigate(context, page: SettingsPage())
  /// ```
  Widget onTapNavigate(
    BuildContext context, {
    required Widget page,
    bool fullscreenDialog = false,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => page,
            fullscreenDialog: fullscreenDialog,
          ),
        );
      },
      child: this,
    );
  }

  /// Wraps the widget in a [GestureDetector] that pushes a
  /// named route on tap.
  ///
  /// ```dart
  /// widget.onTapPushNamed(context, routeName: '/settings')
  /// ```
  Widget onTapPushNamed(
    BuildContext context, {
    required String routeName,
    Object? arguments,
  }) {
    assert(
      routeName.isNotEmpty,
      'routeName must not be empty.',
    );
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          routeName,
          arguments: arguments,
        );
      },
      child: this,
    );
  }

  /// Wraps the widget in a [GestureDetector] that shows
  /// the widget as a dialog on tap.
  ///
  /// ```dart
  /// Icon(Icons.info).showAsDialog(
  ///   context,
  ///   dialog: AlertDialog(
  ///     title: Text("Info"),
  ///     content: Text("Details here"),
  ///   ),
  /// )
  /// ```
  Widget showAsDialog(
    BuildContext context, {
    required Widget dialog,
    bool barrierDismissible = true,
    Color? barrierColor,
    String? barrierLabel,
    bool useRootNavigator = true,
  }) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (_) => dialog,
          barrierDismissible: barrierDismissible,
          barrierColor: barrierColor,
          barrierLabel: barrierLabel,
          useRootNavigator: useRootNavigator,
        );
      },
      child: this,
    );
  }

  /// Wraps the widget in a [GestureDetector] that shows
  /// a modal bottom sheet on tap.
  ///
  /// ```dart
  /// Text("Show Options").showAsBottomSheet(
  ///   context,
  ///   builder: (ctx) => OptionsList(),
  /// )
  /// ```
  Widget showAsBottomSheet(
    BuildContext context, {
    required WidgetBuilder builder,
    Color? backgroundColor,
    double? elevation,
    ShapeBorder? shape,
    Clip? clipBehavior,
    BoxConstraints? constraints,
    bool isScrollControlled = false,
    bool useRootNavigator = false,
    bool isDismissible = true,
    bool enableDrag = true,
    bool showDragHandle = false,
  }) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: builder,
          backgroundColor: backgroundColor,
          elevation: elevation,
          shape: shape,
          clipBehavior: clipBehavior,
          constraints: constraints,
          isScrollControlled: isScrollControlled,
          useRootNavigator: useRootNavigator,
          isDismissible: isDismissible,
          enableDrag: enableDrag,
          showDragHandle: showDragHandle,
        );
      },
      child: this,
    );
  }

  /// Wraps the widget in a [GestureDetector] that pops
  /// the current route on tap.
  ///
  /// ```dart
  /// Icon(Icons.arrow_back).onTapPop(context)
  /// ```
  Widget onTapPop(BuildContext context, {dynamic result}) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(result),
      child: this,
    );
  }
}
