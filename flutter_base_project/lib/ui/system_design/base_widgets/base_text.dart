import 'package:flutter/material.dart';
import 'package:flutter_base_project/base/providers/color_token_provider.dart';
import 'package:flutter_base_project/base/providers/theme_provider.dart';

/// Enum to define text style design
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

/// Default text widget. Set bodyMedium as default text style.
///
/// [text] - Text message
///
/// [fontSize] - Text size
///
/// [fontWeight] - Text font weight
///
/// [textAlign] - Text alignment
///
/// [fontColor] - Text font color
///
/// [maxLines] - Text max lines
///
/// [textOverflow] - Text overflow type
///
/// [textType] - Text type (headline, body...)
///
/// [decoration] - Text decoration
///
class BaseText extends StatelessWidget {
  const BaseText({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.textAlign,
    this.fontColor,
    this.maxLines,
    this.textOverflow,
    this.textType,
    this.decoration,
    this.height,
  });

  // Text setup
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? textOverflow;
  final Color? fontColor;
  final TextType? textType;
  final TextDecoration? decoration;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.isDarkMode();
    final textStyle = _textStyle(context);

    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: textOverflow,
      style: textStyle?.copyWith(
        decoration: decoration,
        decorationColor: _fontColor(isDarkMode, context),
        fontSize: fontSize,
        color: _fontColor(isDarkMode, context),
        fontWeight: fontWeight,
        height: height,
      ),
    );
  }

  TextStyle? _textStyle(BuildContext context) {
    if (textType == null) return Theme.of(context).textTheme.bodyMedium;
    return textType!.getTextStyle(context);
  }

  Color? _fontColor(bool isDarkMode, BuildContext context) {
    if (fontColor != null) return fontColor;

    return context.colors.text;
  }
}

extension TextWidgetExtensions on TextType {
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
