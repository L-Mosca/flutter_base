import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base_project/base/providers/theme_provider.dart';
import 'package:flutter_base_project/utils/constants/app_colors.dart';
import 'package:flutter_base_project/utils/constants/app_sizes.dart';

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
    this.borderRadius,
    this.borderLightColor,
    this.borderDarkColor,
    this.borderFocusedLightColor,
    this.borderFocusedDarkColor,
    this.borderErrorLightColor,
    this.borderErrorDarkColor,
    this.borderEnabledLightColor,
    this.borderEnabledDarkColor,
    this.margin,
    this.keyboardType,
    this.maxLines,
    this.onSubmitted,
    this.controller,
    this.focusNode,
    this.inputFormatters,
    this.textInputAction,
    this.borderWidth,
  });

  final double? height;
  final double? width;
  final String hintText;
  final EdgeInsets? margin;
  final ValueChanged<String> onTextChanged;
  final double? borderWidth;

  final String? text;
  final double? fontSize;
  final TextDecoration? decoration;
  final FontWeight? fontWeight;
  final double? fontHeight;
  final Color? fontLightColor;
  final Color? fontDarkColor;

  final double? borderRadius;

  final Color? borderLightColor;
  final Color? borderDarkColor;

  final Color? borderFocusedLightColor;
  final Color? borderFocusedDarkColor;

  final Color? borderErrorLightColor;
  final Color? borderErrorDarkColor;

  final Color? borderEnabledLightColor;
  final Color? borderEnabledDarkColor;

  final TextInputType? keyboardType;
  final int? maxLines;
  final void Function(String)? onSubmitted;

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;

  @override
  State<BaseTextField> createState() => _BaseTextFieldState();
}

class _BaseTextFieldState extends State<BaseTextField> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    _controller.text = widget.text ?? '';
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.isDarkMode();
    final textStyle = _textStyle(context);
    _controller.text = widget.text ?? "";

    return Container(
      width: widget.width,
      height: widget.height,
      margin: widget.margin,
      child: TextField(
        focusNode: widget.focusNode ?? _focusNode,
        controller: widget.controller ?? _controller,
        style: _defaultTextStyle(textStyle, isDarkMode),
        decoration: _hintStyle(textStyle, isDarkMode),
        onChanged: _onTextChanged,
        maxLines: widget.maxLines,
        keyboardType: widget.keyboardType ?? TextInputType.text,
        textInputAction: widget.textInputAction ?? TextInputAction.next,
        onSubmitted: widget.onSubmitted,
        inputFormatters: widget.inputFormatters,
      ),
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
      border: _defaultBorder(isDarkMode),
      enabledBorder: _defaultBorder(isDarkMode),
      focusedBorder: _defaultBorder(isDarkMode),
      errorBorder: _defaultBorder(isDarkMode),
      hintText: widget.hintText,
      labelStyle: _defaultTextStyle(textStyle, isDarkMode),
      hintStyle: _labelTextStyle,
      counter: const Offstage(),
    );
  }

  OutlineInputBorder _defaultBorder(bool isDarkMode) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        widget.borderRadius ?? AppSizes.radiusLarge,
      ),
      borderSide: BorderSide(
        color: _borderColor(isDarkMode),
        width: widget.borderWidth ?? 1.0,
      ),
    );
  }

  Color _borderColor(bool isDarkMode) {
    return (isDarkMode ? widget.borderDarkColor : widget.borderLightColor) ??
        AppColors.black;
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
