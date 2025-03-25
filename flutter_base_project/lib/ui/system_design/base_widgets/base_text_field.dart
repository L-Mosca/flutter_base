import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    this.fontLightColor,
    this.fontDarkColor,

    // Border
    this.borderRadius,
    this.borderLightColor,
    this.borderDarkColor,
    this.borderFocusedLightColor,
    this.borderFocusedDarkColor,
    this.borderErrorLightColor,
    this.borderErrorDarkColor,
    this.borderEnabledLightColor,
    this.borderEnabledDarkColor,

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
  final Color? fontLightColor;
  final Color? fontDarkColor;

  // Border
  final double? borderRadius;
  final Color? borderLightColor;
  final Color? borderDarkColor;
  final Color? borderFocusedLightColor;
  final Color? borderFocusedDarkColor;
  final Color? borderErrorLightColor;
  final Color? borderErrorDarkColor;
  final Color? borderEnabledLightColor;
  final Color? borderEnabledDarkColor;

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
    if (isDarkMode && widget.fontDarkColor != null) return widget.fontDarkColor;

    if (!isDarkMode && widget.fontLightColor != null) {
      return widget.fontLightColor;
    }

    return isDarkMode ? AppColors.fontDark : AppColors.fontLight;
  }

  InputDecoration _hintStyle(TextStyle? textStyle, bool isDarkMode) {
    return InputDecoration(
      border: _buildBorder(
        widget.borderLightColor,
        widget.borderDarkColor,
        isDarkMode,
      ),
      enabledBorder: _buildBorder(
        widget.borderEnabledLightColor,
        widget.borderEnabledDarkColor,
        isDarkMode,
      ),
      focusedBorder: _buildBorder(
        widget.borderFocusedLightColor,
        widget.borderFocusedDarkColor,
        isDarkMode,
      ),
      errorBorder: _buildBorder(
        widget.borderErrorLightColor,
        widget.borderErrorDarkColor,
        isDarkMode,
      ),
      hintText: widget.hintText,
      labelStyle: _defaultTextStyle(textStyle, isDarkMode),
      hintStyle: _labelTextStyle(isDarkMode),
      counter: const Offstage(),
      contentPadding: widget.contentPadding,
      suffixIcon: widget.suffixIcon,
      prefixIcon: widget.prefixIcon,
    );
  }

  OutlineInputBorder _buildBorder(
    Color? lightColor,
    Color? darkColor,
    bool isDarkMode,
  ) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        widget.borderRadius ?? AppSizes.radiusMini,
      ),
      borderSide: BorderSide(
        color: _getBorderColor(lightColor, darkColor, isDarkMode),
        width: widget.borderWidth ?? 1.0,
      ),
    );
  }

  Color _getBorderColor(Color? lightColor, Color? darkColor, bool isDarkMode) {
    if (isDarkMode && darkColor != null) return darkColor;
    if (!isDarkMode && lightColor != null) return lightColor;
    return isDarkMode ? AppColors.borderDark : AppColors.borderLight;
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
