import 'package:flutter/material.dart';

/// SwiftUI-style modifiers for [Image] widgets.
///
/// Provides chainable methods to configure image fitting,
/// coloring, and common layout patterns.
extension ImageModifier on Image {
  /// Sets the [BoxFit] on the image.
  ///
  /// ```dart
  /// Image.asset('photo.png').resizable(fit: BoxFit.cover)
  /// ```
  Image resizable({BoxFit fit = BoxFit.contain}) {
    return Image(
      image: image,
      key: key,
      fit: fit,
      width: width,
      height: height,
      color: color,
      colorBlendMode: colorBlendMode,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      filterQuality: filterQuality,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
    );
  }

  /// Applies a color blend to the image.
  ///
  /// ```dart
  /// Image.asset('icon.png').colorBlend(Colors.blue, BlendMode.srcIn)
  /// ```
  Image colorBlend(Color blendColor, [BlendMode mode = BlendMode.srcIn]) {
    return Image(
      image: image,
      key: key,
      fit: fit,
      width: width,
      height: height,
      color: blendColor,
      colorBlendMode: mode,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      filterQuality: filterQuality,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
    );
  }

  /// Sets the image dimensions.
  ///
  /// ```dart
  /// Image.asset('avatar.png').imageSize(width: 48, height: 48)
  /// ```
  Image imageSize({double? width, double? height}) {
    assert(
      width == null || width >= 0,
      'Image width must be non-negative, got $width.',
    );
    assert(
      height == null || height >= 0,
      'Image height must be non-negative, got $height.',
    );
    return Image(
      image: image,
      key: key,
      fit: fit,
      width: width ?? this.width,
      height: height ?? this.height,
      color: color,
      colorBlendMode: colorBlendMode,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      filterQuality: filterQuality,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
    );
  }
}
