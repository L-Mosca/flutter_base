import 'package:flutter/material.dart';
import 'package:flutter_base_project/ui/system_design/base_widgets/snack_bar/base_snack_bar.dart';

extension DeviceExtensions on BuildContext {
  void showSnackBar({required String message}) {
    ScaffoldMessenger.of(this).removeCurrentSnackBar();

    ScaffoldMessenger.of(this).showSnackBar(
      BaseSnackBar.defaultSnackBar(message: message, context: this),
    );
  }
}
