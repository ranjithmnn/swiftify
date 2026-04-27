import 'package:flutter/material.dart';

/// Grid extensions for lists.
///
/// Converts any [List] into a [GridView] widget with
/// a builder pattern, similar to the existing list extensions.
extension GenericGridViewBuilder<T> on List<T> {
  /// Builds a [GridView.builder] with a fixed cross-axis count.
  ///
  /// ```dart
  /// final items = ["Apple", "Banana", "Cherry"];
  ///
  /// items.asGridView(
  ///   crossAxisCount: 2,
  ///   itemBuilder: (context, index, item) {
  ///     return Card(child: Center(child: Text(item)));
  ///   },
  /// )
  /// ```
  Widget asGridView({
    required int crossAxisCount,
    required Widget Function(BuildContext context, int index, T item) itemBuilder,
    Axis scrollDirection = Axis.vertical,
    bool shrinkWrap = false,
    ScrollPhysics? physics,
    EdgeInsetsGeometry? padding,
    bool? primary,
    ScrollController? controller,
    bool reverse = false,
    double mainAxisSpacing = 0.0,
    double crossAxisSpacing = 0.0,
    double childAspectRatio = 1.0,
    double? mainAxisExtent,
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
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: mainAxisSpacing,
        crossAxisSpacing: crossAxisSpacing,
        childAspectRatio: childAspectRatio,
        mainAxisExtent: mainAxisExtent,
      ),
      itemCount: length,
      itemBuilder: (context, index) => itemBuilder(context, index, this[index]),
      scrollDirection: scrollDirection,
      shrinkWrap: shrinkWrap,
      physics: physics,
      padding: padding,
      primary: primary,
      controller: controller,
      reverse: reverse,
    );
  }

  /// Builds a [GridView.builder] with a maximum cross-axis extent.
  ///
  /// ```dart
  /// items.asGridViewExtent(
  ///   maxCrossAxisExtent: 200,
  ///   itemBuilder: (context, index, item) {
  ///     return Card(child: Center(child: Text(item)));
  ///   },
  /// )
  /// ```
  Widget asGridViewExtent({
    required double maxCrossAxisExtent,
    required Widget Function(BuildContext context, int index, T item) itemBuilder,
    Axis scrollDirection = Axis.vertical,
    bool shrinkWrap = false,
    ScrollPhysics? physics,
    EdgeInsetsGeometry? padding,
    bool? primary,
    ScrollController? controller,
    bool reverse = false,
    double mainAxisSpacing = 0.0,
    double crossAxisSpacing = 0.0,
    double childAspectRatio = 1.0,
    double? mainAxisExtent,
  }) {
    assert(
      maxCrossAxisExtent > 0,
      'maxCrossAxisExtent must be greater than 0, got $maxCrossAxisExtent.',
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
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: maxCrossAxisExtent,
        mainAxisSpacing: mainAxisSpacing,
        crossAxisSpacing: crossAxisSpacing,
        childAspectRatio: childAspectRatio,
        mainAxisExtent: mainAxisExtent,
      ),
      itemCount: length,
      itemBuilder: (context, index) => itemBuilder(context, index, this[index]),
      scrollDirection: scrollDirection,
      shrinkWrap: shrinkWrap,
      physics: physics,
      padding: padding,
      primary: primary,
      controller: controller,
      reverse: reverse,
    );
  }
}
