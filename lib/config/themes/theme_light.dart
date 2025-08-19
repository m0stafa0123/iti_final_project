import 'package:flutter_application_1/core/imports/imports.dart';

class ThemeLight {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color.fromARGB(255, 95, 106, 189),
    primaryColor: AppColors.primeryColor,

    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(255, 3, 22, 151),
      foregroundColor: Colors.white,
      elevation: 25,
      centerTitle: true,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        alignment: Alignment.center,
        backgroundColor: AppColors.buttomAddButtom,
        foregroundColor: AppColors.witecolor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        shadowColor: Colors.blue.withOpacity(0.4), // لون الظل
        elevation: 10, // قوة الظل
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.textGreyColor,
      hintStyle: TextStyle(color: AppColors.textGreyColor),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.buttomAddButtom),
        borderRadius: BorderRadius.circular(15),
      ),
    ),
  );
}
