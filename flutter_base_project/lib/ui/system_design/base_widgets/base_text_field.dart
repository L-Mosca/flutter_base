import 'package:flutter/material.dart';
import 'package:flutter_base_project/base/providers/theme_provider.dart';
import 'package:flutter_base_project/utils/constants/app_colors.dart';

class BaseTextField extends StatefulWidget {
  const BaseTextField({
    super.key,
    this.height,
    this.width,
    required this.hintText,
    this.text,
    required this.onTextChanged,
    this.fontSize,
    this.decoration,
    this.fontWeight,
    this.fontHeight,
    this.fontLightColor,
    this.fontDarkColor,
  });

  final double? height;
  final double? width;
  final String hintText;
  final ValueChanged<String> onTextChanged;

  final String? text;
  final double? fontSize;
  final TextDecoration? decoration;
  final FontWeight? fontWeight;
  final double? fontHeight;
  final Color? fontLightColor;
  final Color? fontDarkColor;

  @override
  State<BaseTextField> createState() => _BaseTextFieldState();
}

class _BaseTextFieldState extends State<BaseTextField> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    _controller.text = widget.text ?? '';
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.isDarkMode();
    final textStyle = _textStyle(context);
    _controller.text = widget.text ?? "";

    return TextField(
      controller: _controller,
      style: _defaultTextStyle(textStyle, isDarkMode),
      decoration: _hintStyle(textStyle, isDarkMode),
      onChanged: _onTextChanged,
      maxLines: null,
      keyboardType: TextInputType.multiline,
    );
  }

  TextStyle? _textStyle(BuildContext context) =>
      Theme.of(context).textTheme.bodyMedium;

  TextStyle? _defaultTextStyle(TextStyle? textStyle, bool isDarkMode) {
    return textStyle?.copyWith(
      decoration: widget.decoration,
      decorationColor: _fontColor(isDarkMode),
      fontSize: widget.fontSize,
      color: _fontColor(isDarkMode),
      fontWeight: widget.fontWeight,
      height: widget.height,
    );
  }

  Color? _fontColor(bool isDarkMode) {
    if (isDarkMode && widget.fontDarkColor != null) {
      return widget.fontDarkColor!;
    }
    if (!isDarkMode && widget.fontLightColor != null) {
      return widget.fontLightColor!;
    }
    return null;
  }

  InputDecoration _hintStyle(TextStyle? textStyle, bool isDarkMode) {
    return InputDecoration(
      border: InputBorder.none,
      hintText: widget.hintText,
      labelStyle: _defaultTextStyle(textStyle, isDarkMode),
      hintStyle: _labelTextStyle,
      counter: const Offstage(),
    );
  }

  TextStyle get _labelTextStyle =>
      const TextStyle(color: AppColors.grey, fontWeight: FontWeight.w400);

  void _onTextChanged(String text) {
    setState(() {
      _controller.text = text;
      widget.onTextChanged(text);
    });
  }
}
