import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:islami_app/ui/utils/app_assets.dart';
import 'package:islami_app/ui/utils/app_colors.dart';

abstract class AppTheme{
  static  TextStyle appBarTitleTextStyle = TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: AppColors.accentColor);
  static  TextStyle quranTabTitleTextStyle = TextStyle(fontSize: 25,fontWeight: FontWeight.w600,color: AppColors.accentColor);
  static TextStyle settingsTabTitle = TextStyle(fontSize: 25,fontWeight: FontWeight.w600,color: AppColors.accentColor);
  static TextStyle settingsOptionTitle = TextStyle(fontSize: 22,fontWeight: FontWeight.normal,color: AppColors.accentColor);

  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.transparent,
      primaryColor: AppColors.primaryColor,
      dividerTheme: DividerThemeData(
        thickness: 3,
        color: AppColors.primaryColor,
      ),
      appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: AppColors.transparent,
          elevation: 0,
          titleTextStyle: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: AppColors.accentColor)
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: AppColors.accentColor,
          selectedIconTheme: IconThemeData(size: 32),
          unselectedIconTheme: IconThemeData(size: 26)
      ),
      textTheme: TextTheme(
          bodySmall: settingsOptionTitle,
          bodyMedium: settingsTabTitle,
          displayMedium: quranTabTitleTextStyle
      )
  );

  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.transparent,
      primaryColor: AppColors.primiaryDark,
      dividerTheme: DividerThemeData(
        thickness: 3,
        color: AppColors.accentDark,
      ),
      appBarTheme:  AppBarTheme(
          centerTitle: true,
          backgroundColor: AppColors.transparent,
          elevation: 0,
          titleTextStyle: appBarTitleTextStyle.copyWith(color: AppColors.white)
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: AppColors.accentDark,
          selectedIconTheme: IconThemeData(size: 32),
          unselectedIconTheme: IconThemeData(size: 26)
      ),
      textTheme: TextTheme(
          bodySmall: settingsOptionTitle.copyWith(color: AppColors.white),
          bodyMedium: settingsTabTitle.copyWith(color: AppColors.white),
          displayMedium: quranTabTitleTextStyle.copyWith(color: AppColors.white)
      )
  );

}