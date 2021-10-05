import 'package:flutter/material.dart';
import 'package:muse_chat/constants/colors.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  static ThemeData darkTheme = ThemeData(
      appBarTheme:
          AppBarTheme(backgroundColor: DarkColors.green1, elevation: 0),
      scaffoldBackgroundColor: DarkColors.black1,
      primaryColor: DarkColors.green1,
      accentColor: DarkColors.green2,
      colorScheme: ColorScheme.fromSwatch());
  static ThemeData lightTheme = ThemeData(
      appBarTheme:
          AppBarTheme(backgroundColor: LightColors.green2, elevation: 0));
}
