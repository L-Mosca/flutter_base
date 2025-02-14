import 'package:flutter/material.dart';

/// Light & Dark Check Box Themes
class CustomCheckBoxTheme {
  CustomCheckBoxTheme._();

  /// -- Customizable Light Check Box Theme
  static CheckboxThemeData lightCheckBoxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: WidgetStateProperty.resolveWith((states) {
      return states.contains(WidgetState.selected)
          ? Colors.white
          : Colors.black;
    }),
    fillColor: WidgetStateProperty.resolveWith((states) {
      return states.contains(WidgetState.selected)
          ? Colors.blue
          : Colors.transparent;
    }),
  );

  /// -- Customizable Dark Check Box Theme
  static CheckboxThemeData darkCheckBoxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: WidgetStateProperty.resolveWith((states) {
      return states.contains(WidgetState.selected)
          ? Colors.white
          : Colors.black;
    }),
    fillColor: WidgetStateProperty.resolveWith((states) {
      return states.contains(WidgetState.selected)
          ? Colors.blue
          : Colors.transparent;
    }),
  );
}
