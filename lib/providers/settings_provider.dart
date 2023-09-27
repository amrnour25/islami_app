import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class settingsProvider extends ChangeNotifier{
  String currentLocale = "en";
  ThemeMode currentMode = ThemeMode.light;

  void setCurrentLocale(String newLocale) {
    currentLocale = newLocale;
    notifyListeners();
  }
  void setCurrentMode(ThemeMode newThemeMode){
    currentMode =newThemeMode;
    notifyListeners();
  }
  bool isDarkMode()=> currentMode ==ThemeMode.dark;
}