import 'package:flutter/material.dart';

/// Responsive design modifiers for any widget.
///
/// Provides chainable methods for responsive layouts based
/// on screen size, orientation, and platform.
extension ResponsiveModifier on Widget {
  /// Shows different widgets based on screen width breakpoints.
  ///
  /// Uses a [LayoutBuilder] to determine the available width
  /// and returns the appropriate widget.
  ///
  /// ```dart
  /// widget.responsive(
  ///   mobile: MobileLayout(),
  ///   tablet: TabletLayout(),
  ///   desktop: DesktopLayout(),
  /// )
  /// ```
  Widget responsive({
    Widget? mobile,
    Widget? tablet,
    Widget? desktop,
    double mobileBreakpoint = 600,
    double tabletBreakpoint = 1024,
  }) {
    assert(
      mobileBreakpoint > 0,
      'mobileBreakpoint must be greater than 0, got $mobileBreakpoint.',
    );
    assert(
      tabletBreakpoint > 0,
      'tabletBreakpoint must be greater than 0, got $tabletBreakpoint.',
    );
    assert(
      mobileBreakpoint < tabletBreakpoint,
      'mobileBreakpoint ($mobileBreakpoint) must be less than tabletBreakpoint ($tabletBreakpoint).',
    );
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= tabletBreakpoint && desktop != null) {
          return desktop;
        }
        if (constraints.maxWidth >= mobileBreakpoint && tablet != null) {
          return tablet;
        }
        return mobile ?? this;
      },
    );
  }

  /// Shows different widgets based on screen orientation.
  ///
  /// ```dart
  /// widget.onOrientation(
  ///   portrait: PortraitLayout(),
  ///   landscape: LandscapeLayout(),
  /// )
  /// ```
  Widget onOrientation({
    required Widget portrait,
    required Widget landscape,
  }) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return orientation == Orientation.portrait ? portrait : landscape;
      },
    );
  }

  /// Applies responsive padding that scales with screen width.
  ///
  /// Padding is calculated as a fraction of the available width,
  /// bounded by [min] and [max] values.
  ///
  /// ```dart
  /// widget.responsivePadding(fraction: 0.05)
  /// ```
  Widget responsivePadding({
    double fraction = 0.04,
    double min = 8.0,
    double max = 48.0,
  }) {
    assert(
      fraction >= 0 && fraction <= 1,
      'Fraction must be between 0 and 1, got $fraction.',
    );
    assert(
      min >= 0,
      'Minimum padding must be non-negative, got $min.',
    );
    assert(
      min <= max,
      'Minimum padding ($min) must be less than or equal to maximum padding ($max).',
    );
    return LayoutBuilder(
      builder: (context, constraints) {
        final computed = constraints.maxWidth * fraction;
        final clamped = computed.clamp(min, max);
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: clamped),
          child: this,
        );
      },
    );
  }

  /// Constrains the widget to a maximum width, commonly used
  /// for centering content on large screens.
  ///
  /// ```dart
  /// widget.maxWidth(800)
  /// ```
  Widget maxWidth(double maxWidth) {
    assert(
      maxWidth > 0,
      'maxWidth must be greater than 0, got $maxWidth.',
    );
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: this,
      ),
    );
  }
}
