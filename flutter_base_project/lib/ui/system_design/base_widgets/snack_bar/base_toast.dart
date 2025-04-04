import 'package:flutter/material.dart';
import 'package:flutter_base_project/base/providers/color_token_provider.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/base_text.dart';
import 'package:flutter_base_project/utils/constants/app_colors.dart';
import 'package:flutter_base_project/utils/constants/app_constants.dart';
import 'package:flutter_base_project/utils/constants/app_sizes.dart';

class BaseToast {
  static SnackBar defaultToast({
    required String message,
    required BuildContext context,
    Duration? duration,
    Color? backgroundColor,
    double? elevation,
    ShapeBorder? shape,
  }) {
    return SnackBar(
      content: _defaultTextDesign(message, context),
      duration: duration ?? AppConstants.toastShortDuration,
      backgroundColor: backgroundColor ?? context.colors.toast,
      behavior: SnackBarBehavior.floating,
      elevation: elevation ?? 0.0,
      shape: shape ?? _defaultShapeRadius,
    );
  }

  static SnackBar defaultShortToast({
    required String message,
    required BuildContext context,
    Color? backgroundColor,
    double? elevation,
    ShapeBorder? shape,
  }) {
    return SnackBar(
      content: _defaultTextDesign(message, context),
      duration: AppConstants.toastShortDuration,
      backgroundColor: backgroundColor ?? context.colors.toast,
      behavior: SnackBarBehavior.floating,
      elevation: elevation ?? 0.0,
      shape: shape ?? _defaultShapeRadius,
    );
  }

  static SnackBar defaultLongToast({
    required String message,
    required BuildContext context,
    Color? backgroundColor,
    double? elevation,
    ShapeBorder? shape,
  }) {
    return SnackBar(
      content: _defaultTextDesign(message, context),
      duration: AppConstants.toastLongDuration,
      backgroundColor: backgroundColor ?? context.colors.toast,
      behavior: SnackBarBehavior.floating,
      elevation: elevation ?? 0.0,
      shape: shape ?? _defaultShapeRadius,
    );
  }

  static ShapeBorder get _defaultShapeRadius => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.radiusLarge),
      );

  static Widget _defaultTextDesign(String message, BuildContext context) {
    return BaseText(
      text: message,
      textAlign: TextAlign.center,
      fontWeight: FontWeight.w500,
      fontColor: AppColors.white,
    );
  }
}
