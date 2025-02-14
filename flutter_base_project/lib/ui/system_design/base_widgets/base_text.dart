import 'package:flutter/material.dart';
import 'package:flutter_base_project/base/providers/theme_provider.dart';

/// Enum that's define text style design
enum TextType {
  headlineLarge,
  headlineMedium,
  headlineSmall,
  titleLarge,
  titleMedium,
  titleSmall,
  bodyLarge,
  bodyMedium,
  bodySmall,
  labelLarge,
  labelMedium,
  labelSmall,
}

/// Default text widget. By default use bodyMedium as text style.
///
/// [text] - Text message
///
/// [fontSize] - Text size
///
/// [fontWeight] - Text font weight
///
/// [textAlign] - Text alignment
///
/// [fontLightColor] - Text light font color
///
/// [fontDarkColor] - Text dark font color
///
/// [maxLines] - Text max lines
///
/// [textOverflow] - Text overflow type
///
/// [textType] - Text type (headline, body...)
///
/// [decoration] - Text decoration
class BaseText extends StatelessWidget {
  const BaseText({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.textAlign,
    this.fontLightColor,
    this.fontDarkColor,
    this.maxLines,
    this.textOverflow,
    this.textType,
    this.decoration,
  });

  // Text setup
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? textOverflow;
  final Color? fontLightColor;
  final Color? fontDarkColor;
  final TextType? textType;
  final TextDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.actualIsDarkMode();
    final textStyle = _textStyle(context);

    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: textOverflow,
      style: textStyle?.copyWith(
        decoration: decoration,
        decorationColor: _fontColor(isDarkMode),
        fontSize: fontSize,
        color: _fontColor(isDarkMode),
        fontWeight: fontWeight,
      ),
    );
  }

  TextStyle? _textStyle(BuildContext context) {
    if (textType == null) return Theme.of(context).textTheme.bodyMedium;
    return textType!.getTextStyle(context);
  }

  Color? _fontColor(bool isDarkMode) {
    if (isDarkMode && fontDarkColor != null) return fontDarkColor!;
    if (!isDarkMode && fontLightColor != null) return fontLightColor!;
    return null;
  }
}

extension MsTextExtensions on TextType {
  TextStyle? getTextStyle(BuildContext context) {
    final style = Theme.of(context).textTheme;

    switch (this) {
      case TextType.headlineLarge:
        return style.headlineLarge;
      case TextType.headlineMedium:
        return style.headlineMedium;
      case TextType.headlineSmall:
        return style.headlineSmall;
      case TextType.titleLarge:
        return style.titleLarge;
      case TextType.titleMedium:
        return style.titleMedium;
      case TextType.titleSmall:
        return style.titleSmall;
      case TextType.bodyLarge:
        return style.bodyLarge;
      case TextType.bodyMedium:
        return style.bodyMedium;
      case TextType.bodySmall:
        return style.bodySmall;
      case TextType.labelLarge:
        return style.labelLarge;
      case TextType.labelMedium:
        return style.labelMedium;
      case TextType.labelSmall:
        return style.labelSmall;
    }
  }
}
