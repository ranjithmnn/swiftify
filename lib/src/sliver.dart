import 'package:flutter/material.dart';

/// Sliver modifiers for widgets and lists.
///
/// Provides chainable methods to convert standard widgets
/// and lists into sliver-compatible widgets.
extension SliverWidgetModifier on Widget {
  /// Wraps the widget in a [SliverToBoxAdapter].
  ///
  /// Converts a regular widget to a sliver for use
  /// inside a [CustomScrollView].
  ///
  /// ```dart
  /// Text("Header").asSliver()
  /// ```
  Widget asSliver() {
    return SliverToBoxAdapter(
      child: this,
    );
  }

  /// Wraps the widget in a [SliverPadding].
  ///
  /// Adds padding to a sliver widget.
  ///
  /// ```dart
  /// widget.asSliver().sliverPadding(EdgeInsets.all(16))
  /// ```
  Widget sliverPadding(EdgeInsetsGeometry padding) {
    return SliverPadding(
      padding: padding,
      sliver: this,
    );
  }

  /// Wraps the widget in a [SliverFillRemaining].
  ///
  /// The widget will fill the remaining space in the viewport.
  ///
  /// ```dart
  /// Center(child: Text("Empty")).asSliverFillRemaining()
  /// ```
  Widget asSliverFillRemaining({
    bool hasScrollBody = true,
    bool fillOverscroll = false,
  }) {
    return SliverFillRemaining(
      hasScrollBody: hasScrollBody,
      fillOverscroll: fillOverscroll,
      child: this,
    );
  }
}

/// Sliver extensions for lists.
///
/// Converts any [List] into sliver widgets for use
/// inside a [CustomScrollView].
extension SliverListBuilder<T> on List<T> {
  /// Builds a [SliverList] from the list using a builder.
  ///
  /// ```dart
  /// items.asSliverList(
  ///   itemBuilder: (context, index, item) {
  ///     return ListTile(title: Text(item.name));
  ///   },
  /// )
  /// ```
  Widget asSliverList({
    required Widget Function(BuildContext context, int index, T item) itemBuilder,
  }) {
    return SliverList.builder(
      itemCount: length,
      itemBuilder: (context, index) => itemBuilder(context, index, this[index]),
    );
  }

  /// Builds a [SliverGrid] from the list using a builder.
  ///
  /// ```dart
  /// items.asSliverGrid(
  ///   crossAxisCount: 2,
  ///   itemBuilder: (context, index, item) {
  ///     return Card(child: Center(child: Text(item)));
  ///   },
  /// )
  /// ```
  Widget asSliverGrid({
    required int crossAxisCount,
    required Widget Function(BuildContext context, int index, T item) itemBuilder,
    double mainAxisSpacing = 0.0,
    double crossAxisSpacing = 0.0,
    double childAspectRatio = 1.0,
  }) {
    assert(
      crossAxisCount > 0,
      'crossAxisCount must be greater than 0, got $crossAxisCount.',
    );
    assert(
      mainAxisSpacing >= 0,
      'mainAxisSpacing must be non-negative, got $mainAxisSpacing.',
    );
    assert(
      crossAxisSpacing >= 0,
      'crossAxisSpacing must be non-negative, got $crossAxisSpacing.',
    );
    assert(
      childAspectRatio > 0,
      'childAspectRatio must be greater than 0, got $childAspectRatio.',
    );
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: mainAxisSpacing,
        crossAxisSpacing: crossAxisSpacing,
        childAspectRatio: childAspectRatio,
      ),
      itemCount: length,
      itemBuilder: (context, index) => itemBuilder(context, index, this[index]),
    );
  }
}
