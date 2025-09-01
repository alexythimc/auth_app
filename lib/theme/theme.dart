import 'package:flutter/material.dart';

import 'custom_themes/appbar_theme.dart';
import 'custom_themes/bottom_navigationbar_theme.dart';
import 'custom_themes/bottom_sheet_theme.dart';
import 'custom_themes/checkbox_theme.dart';
import 'custom_themes/chip_theme.dart';
import 'custom_themes/elevatedButtonTheme.dart';
import 'custom_themes/outlined_button_theme.dart';
import 'custom_themes/text_form_field_theme.dart';
import 'custom_themes/text_theme.dart';

class TappTheme {
  TappTheme._(); // To avoid creating instances
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255),
    primaryColor: Colors.white,
    secondaryHeaderColor: Colors.white,
    textTheme: TTextTheme.textTheme,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    bottomNavigationBarTheme: TBottomNavigationBarTheme.lightTheme,
    // textButtonTheme: TTextButtonTheme.light,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightTextFormFieldTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    chipTheme: TChipTheme.lightChipTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: Colors.white,
    secondaryHeaderColor: Colors.black,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    bottomNavigationBarTheme: TBottomNavigationBarTheme.darkTheme,
    textTheme: TTextTheme.darkTextTheme,
    scaffoldBackgroundColor: Color.fromARGB(255, 0, 0, 0),
    // textButtonTheme: TTextButtonTheme.dark,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkTextFormFieldTheme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    checkboxTheme: TCheckboxTheme.darkCheckboxTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    chipTheme: TChipTheme.darkChipTheme,
  );
}
