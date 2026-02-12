import 'package:flutter/material.dart';

/// A builder-style text wrapper.
/// You can chain modifiers and finally call `.build()` to get a real Text widget.
class StyledText {
  final String text;

  final TextStyle style;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final int? maxLines;
  final String? semanticsLabel;
  final StrutStyle? strutStyle;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final Color? selectionColor;

  const StyledText(
    this.text, {
    this.style = const TextStyle(),
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.semanticsLabel,
    this.strutStyle,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
  });

  // -----------------------------
  // Style modifiers
  // -----------------------------

  StyledText fontSize(double size) =>
      copyWith(style: style.copyWith(fontSize: size));

  StyledText fontWeight(FontWeight weight) =>
      copyWith(style: style.copyWith(fontWeight: weight));

  StyledText fontFamily(String family) =>
      copyWith(style: style.copyWith(fontFamily: family));

  StyledText color(Color color) =>
      copyWith(style: style.copyWith(color: color));

  StyledText italic() =>
      copyWith(style: style.copyWith(fontStyle: FontStyle.italic));

  StyledText bold() =>
      copyWith(style: style.copyWith(fontWeight: FontWeight.bold));

  StyledText underline() =>
      copyWith(style: style.copyWith(decoration: TextDecoration.underline));

  StyledText letterSpacing(double value) =>
      copyWith(style: style.copyWith(letterSpacing: value));

  StyledText height(double value) =>
      copyWith(style: style.copyWith(height: value));

  StyledText backgroundColor(Color color) =>
      copyWith(style: style.copyWith(backgroundColor: color));

  StyledText wordSpacing(double value) =>
      copyWith(style: style.copyWith(wordSpacing: value));

  StyledText shadows(List<Shadow> shadows) =>
      copyWith(style: style.copyWith(shadows: shadows));

  StyledText shadow({
    Color color = const Color(0xFF000000),
    double blurRadius = 0.0,
    Offset offset = Offset.zero,
  }) {
    return copyWith(
      style: style.copyWith(
        shadows: [
          Shadow(
            color: color,
            blurRadius: blurRadius,
            offset: offset,
          ),
        ],
      ),
    );
  }

  StyledText strikethrough() => copyWith(
        style: style.copyWith(decoration: TextDecoration.lineThrough),
      );

  StyledText overline() => copyWith(
        style: style.copyWith(decoration: TextDecoration.overline),
      );

  // -----------------------------
  // Text modifiers
  // -----------------------------

  StyledText center() => copyWith(textAlign: TextAlign.center);
  StyledText justify() => copyWith(textAlign: TextAlign.justify);
  StyledText start() => copyWith(textAlign: TextAlign.start);
  StyledText end() => copyWith(textAlign: TextAlign.end);

  StyledText align(TextAlign align) => copyWith(textAlign: align);

  StyledText lines(int max) => copyWith(maxLines: max);

  StyledText clip() => copyWith(overflow: TextOverflow.clip);
  StyledText fade() => copyWith(overflow: TextOverflow.fade);
  StyledText visible() => copyWith(overflow: TextOverflow.visible);

  StyledText ellipsis() => copyWith(overflow: TextOverflow.ellipsis);

  // -----------------------------
  // CopyWith helper
  // -----------------------------

  StyledText copyWith({
    String? text,
    TextStyle? style,
    TextAlign? textAlign,
    TextDirection? textDirection,
    Locale? locale,
    bool? softWrap,
    TextOverflow? overflow,
    int? maxLines,
    String? semanticsLabel,
    StrutStyle? strutStyle,
    TextWidthBasis? textWidthBasis,
    TextHeightBehavior? textHeightBehavior,
    Color? selectionColor,
  }) {
    return StyledText(
      text ?? this.text,
      style: style ?? this.style,
      textAlign: textAlign ?? this.textAlign,
      textDirection: textDirection ?? this.textDirection,
      locale: locale ?? this.locale,
      softWrap: softWrap ?? this.softWrap,
      overflow: overflow ?? this.overflow,
      maxLines: maxLines ?? this.maxLines,
      semanticsLabel: semanticsLabel ?? this.semanticsLabel,
      strutStyle: strutStyle ?? this.strutStyle,
      textWidthBasis: textWidthBasis ?? this.textWidthBasis,
      textHeightBehavior: textHeightBehavior ?? this.textHeightBehavior,
      selectionColor: selectionColor ?? this.selectionColor,
    );
  }

  // -----------------------------
  // Final build
  // -----------------------------

  Text build({Key? key}) {
    return Text(
      text,
      key: key,
      style: style,
      textAlign: textAlign,
      textDirection: textDirection,
      locale: locale,
      softWrap: softWrap,
      overflow: overflow,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
      strutStyle: strutStyle,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
      selectionColor: selectionColor,
    );
  }
}

/// Allows:
/// "Hello".txt.bold().fontSize(16).color(Colors.red).build()
extension StyledTextExtension on String {
  StyledText get txt => StyledText(this);
}
