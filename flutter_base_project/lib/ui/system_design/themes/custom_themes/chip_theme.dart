import 'package:flutter/material.dart';

/// -- Light & Dark Chip Themes
class CustomChipTheme {
  CustomChipTheme._();

  /// -- Customizable Light Chip Theme
  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: Colors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: Colors.black),
    selectedColor: Colors.blue,
    padding: const EdgeInsets.all(12.0),
    checkmarkColor: Colors.white,
  );

  /// -- Customizable Dark Chip Theme
  static ChipThemeData darkChipTheme = const ChipThemeData(
    disabledColor: Colors.grey,
    labelStyle: TextStyle(color: Colors.white),
    selectedColor: Colors.blue,
    padding: EdgeInsets.all(12.0),
    checkmarkColor: Colors.white,
  );
}
