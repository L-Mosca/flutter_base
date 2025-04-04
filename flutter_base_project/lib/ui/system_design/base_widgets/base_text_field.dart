import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base_project/base/providers/color_token_provider.dart';
import 'package:flutter_base_project/base/providers/theme_provider.dart';
import 'package:flutter_base_project/utils/constants/app_colors.dart';
import 'package:flutter_base_project/utils/constants/app_sizes.dart';

class BaseTextField extends StatefulWidget {
  const BaseTextField({
    super.key,

    // General Args
    this.height,
    this.width,
    required this.hintText,
    this.margin,
    required this.onTextChanged,
    this.borderWidth,
    this.keyboardType,
    this.maxLines,
    this.onSubmitted,
    this.controller,
    this.focusNode,
    this.inputFormatters,
    this.textInputAction,
    this.obscureText,
    this.contentPadding,
    this.onEditingComplete,

    // Font
    this.text,
    this.fontSize,
    this.decoration,
    this.fontWeight,
    this.fontHeight,
    this.fontColor,

    // Border
    this.borderRadius,
    this.borderColor,
    this.borderFocusedColor,
    this.borderErrorColor,
    this.borderEnabledColor,

    // Icon
    this.suffixIcon,
    this.prefixIcon,
  });

  // General Args
  final double? height;
  final double? width;
  final String hintText;
  final EdgeInsets? margin;
  final ValueChanged<String> onTextChanged;
  final double? borderWidth;
  final TextInputType? keyboardType;
  final int? maxLines;
  final void Function(String)? onSubmitted;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final bool? obscureText;
  final EdgeInsets? contentPadding;
  final void Function()? onEditingComplete;

  // Font
  final String? text;
  final double? fontSize;
  final TextDecoration? decoration;
  final FontWeight? fontWeight;
  final double? fontHeight;
  final Color? fontColor;

  // Border
  final double? borderRadius;
  final Color? borderColor;
  final Color? borderFocusedColor;
  final Color? borderErrorColor;
  final Color? borderEnabledColor;

  // Icon
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  @override
  State<BaseTextField> createState() => _BaseTextFieldState();
}

class _BaseTextFieldState extends State<BaseTextField> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void didUpdateWidget(covariant BaseTextField oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.text != oldWidget.text || widget.text != _controller.text) {
      _controller.text = widget.text ?? "";
    }
  }

  @override
  void initState() {
    super.initState();
    _controller.text = widget.text ?? "";
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

    return TextField(
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
      obscureText: widget.obscureText ?? false,
      onEditingComplete: widget.onEditingComplete,
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
      fontWeight: widget.fontWeight ?? FontWeight.w500,
      height: widget.height,
    );
  }

  Color? _fontColor(bool isDarkMode) {
    if (widget.fontColor != null) return widget.fontColor;
    return context.colors.text;
  }

  InputDecoration _hintStyle(TextStyle? textStyle, bool isDarkMode) {
    return InputDecoration(
      border: _buildBorder(widget.borderColor, 0),
      enabledBorder: _buildBorder(widget.borderEnabledColor, 1),
      focusedBorder: _buildBorder(widget.borderFocusedColor, 2),
      errorBorder: _buildBorder(widget.borderEnabledColor, 3),
      hintText: widget.hintText,
      labelStyle: _defaultTextStyle(textStyle, isDarkMode),
      hintStyle: _labelTextStyle(isDarkMode),
      counter: const Offstage(),
      contentPadding: widget.contentPadding,
      suffixIcon: widget.suffixIcon,
      prefixIcon: widget.prefixIcon,
    );
  }

  OutlineInputBorder _buildBorder(Color? color, int index) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        widget.borderRadius ?? AppSizes.radiusMini,
      ),
      borderSide: BorderSide(
        color: _getBorderColor(color, index),
        width: widget.borderWidth ?? 1.0,
      ),
    );
  }

  Color _getBorderColor(Color? color, int index) {
    if (color != null) return color;

    if (index == 0) return context.colors.border;
    if (index == 1) return context.colors.borderEnabled;
    if (index == 2) return context.colors.borderFocused;
    if (index == 3) return context.colors.borderError;

    return context.colors.border;
  }

  TextStyle _labelTextStyle(bool isDarkMode) => TextStyle(
        color: isDarkMode ? AppColors.hintDark : AppColors.hintLight,
        fontWeight: FontWeight.w400,
      );

  void _onTextChanged(String text) {
    setState(() {
      _controller.text = text;
      widget.onTextChanged(text);
    });
  }
}
