import 'package:flutter/material.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/base_text.dart';
import 'package:flutter_base_project/utils/constants/app_colors.dart';
import 'package:flutter_base_project/utils/constants/app_constants.dart';
import 'package:flutter_base_project/utils/constants/app_sizes.dart';

class BaseSnackBar {
  static SnackBar defaultSnackBar({
    required String message,
    required BuildContext context,
  }) {
    return SnackBar(
      content: _defaultTextDesign(message),
      duration: AppConstants.snackBarDuration,
      backgroundColor: AppColors.primary,
      behavior: SnackBarBehavior.fixed,
      elevation: 8.0,
      shape: _defaultShapeRadius,
    );
  }

  static ShapeBorder get _defaultShapeRadius => RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(AppSizes.radiusMini),
          topLeft: Radius.circular(AppSizes.radiusMini),
        ),
      );

  static BaseText _defaultTextDesign(String message) {
    return BaseText(
      fontLightColor: AppColors.white,
      fontDarkColor: AppColors.white,
      text: message,
      textAlign: TextAlign.center,
      fontWeight: FontWeight.w500,
    );
  }
}
