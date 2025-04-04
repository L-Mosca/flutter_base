import 'package:flutter/material.dart';
import 'package:flutter_base_project/utils/constants/app_colors.dart';

abstract class ColorToken {
  Color get primary;
  Color get background;
  Color get accent;
  Color get text;
  Color get error;

  Color get border;
  Color get borderFocused;
  Color get borderError;
  Color get borderEnabled;

  Color get shimmerPrimaryColor;
  Color get shimmerSecondaryColor;

  Color get cardColor;
  Color get shadow;

  Color get star;
  Color get starFilled;

  Color get toast;
  Color get snackBar;
}

class LightColorToken implements ColorToken {
  @override Color get primary => AppColors.primaryLight;
  @override Color get accent => AppColors.accentLight;
  @override Color get background => AppColors.lightBackground;
  @override Color get text => AppColors.fontLight;
  @override Color get error => AppColors.errorLight;

  @override Color get border => AppColors.borderLight;
  @override Color get borderFocused => AppColors.borderLight;
  @override Color get borderError => AppColors.borderLight;
  @override Color get borderEnabled => AppColors.borderLight;

  @override Color get shimmerPrimaryColor => AppColors.shimmerPrimaryLightColor;
  @override Color get shimmerSecondaryColor => AppColors.shimmerSecondaryLightColor;

  @override Color get cardColor => AppColors.white;
  @override Color get shadow => AppColors.black.withValues(alpha: 0.2);

  @override Color get star => AppColors.amber;
  @override Color get starFilled => AppColors.gray200;

  @override Color get toast => AppColors.darkGrey;
  @override Color get snackBar => AppColors.accentLight;
}

class DarkColorToken implements ColorToken {
  @override Color get primary => AppColors.primaryDark;
  @override Color get accent => AppColors.accentDark;
  @override Color get background => AppColors.darkBackground;
  @override Color get text => AppColors.fontDark;
  @override Color get error => AppColors.errorDark;

  @override Color get border => AppColors.borderDark;
  @override Color get borderFocused => AppColors.borderDark;
  @override Color get borderError => AppColors.borderDark;
  @override Color get borderEnabled => AppColors.borderDark;

  @override Color get shimmerPrimaryColor => AppColors.shimmerPrimaryDarkColor;
  @override Color get shimmerSecondaryColor => AppColors.shimmerSecondaryDarkColor;

  @override Color get cardColor => AppColors.darkBackground;
  @override Color get shadow => AppColors.blueDark700;

  @override Color get star => AppColors.amber;
  @override Color get starFilled => AppColors.blueDark600;

  @override Color get toast => AppColors.blueDark600;
  @override Color get snackBar => AppColors.accentDark;
}