import 'package:flutter/material.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/snack_bar/base_snack_bar.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/snack_bar/base_toast.dart';

extension DeviceExtensions on BuildContext {
  void showSnackBar({
    required String message,
    Duration? duration,
    Color? backgroundColor,
    double? elevation,
    ShapeBorder? shape,
  }) {
    ScaffoldMessenger.of(this).removeCurrentSnackBar();

    ScaffoldMessenger.of(this).showSnackBar(
      BaseSnackBar.defaultSnackBar(
        message: message,
        context: this,
        duration: duration,
        backgroundColor: backgroundColor,
        elevation: elevation,
        shape: shape,
      ),
    );
  }

  void showShortSnackBar({
    required String message,
    Color? backgroundColor,
    double? elevation,
    ShapeBorder? shape,
  }) {
    ScaffoldMessenger.of(this).removeCurrentSnackBar();

    ScaffoldMessenger.of(this).showSnackBar(
      BaseSnackBar.defaultSnackBar(
        message: message,
        context: this,
        backgroundColor: backgroundColor,
        elevation: elevation,
        shape: shape,
      ),
    );
  }

  void showLongSnackBar({
    required String message,
    Color? backgroundColor,
    double? elevation,
    ShapeBorder? shape,
  }) {
    ScaffoldMessenger.of(this).removeCurrentSnackBar();

    ScaffoldMessenger.of(this).showSnackBar(
      BaseSnackBar.defaultSnackBar(
        message: message,
        context: this,
        backgroundColor: backgroundColor,
        elevation: elevation,
        shape: shape,
      ),
    );
  }

  void showToast({
    required String message,
    Duration? duration,
    Color? backgroundColor,
    double? elevation,
    ShapeBorder? shape,
  }) {
    ScaffoldMessenger.of(this).removeCurrentSnackBar();

    ScaffoldMessenger.of(this).showSnackBar(
      BaseToast.defaultToast(
        message: message,
        context: this,
        duration: duration,
        backgroundColor: backgroundColor,
        elevation: elevation,
        shape: shape,
      ),
    );
  }

  void showShortToast({
    required String message,
    Color? backgroundColor,
    double? elevation,
    ShapeBorder? shape,
  }) {
    ScaffoldMessenger.of(this).removeCurrentSnackBar();

    ScaffoldMessenger.of(this).showSnackBar(
      BaseToast.defaultShortToast(
        message: message,
        context: this,
        backgroundColor: backgroundColor,
        elevation: elevation,
        shape: shape,
      ),
    );
  }

  void showLongToast({
    required String message,
    Color? backgroundColor,
    double? elevation,
    ShapeBorder? shape,
  }) {
    ScaffoldMessenger.of(this).removeCurrentSnackBar();

    ScaffoldMessenger.of(this).showSnackBar(
      BaseToast.defaultLongToast(
        message: message,
        context: this,
        backgroundColor: backgroundColor,
        elevation: elevation,
        shape: shape,
      ),
    );
  }
}
