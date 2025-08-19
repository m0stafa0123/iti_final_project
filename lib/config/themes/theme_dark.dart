import 'package:flutter_application_1/core/imports/imports.dart';

class ThemeDark {
  static ThemeData theme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.witecolor,
    primaryColor: AppColors.primeryColor,

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primeryColor,
      foregroundColor: Colors.white,
      elevation: 25,
      centerTitle: true,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        alignment: Alignment.center,
        backgroundColor: Colors.red,
        foregroundColor: AppColors.witecolor,
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.textfieldColor,
      hintStyle: TextStyle(color: AppColors.textGreyColor),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.buttomAddButtom),
        borderRadius: BorderRadius.circular(25),
      ),
    ),
  );
}
