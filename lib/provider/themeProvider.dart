import 'package:flutter/material.dart';
import 'package:musi_chat/constants/colors.dart';
import 'package:provider/provider.dart';

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
      primaryColor: DarkColors.green1,
      accentColor: DarkColors.green2,
      backgroundColor: DarkColors.green3,
      scaffoldBackgroundColor: DarkColors.black1,
      cardColor: DarkColors.black2,
      canvasColor: DarkColors.black3,
      disabledColor: DarkColors.black4,
      errorColor: DarkColors.red,
      colorScheme: ColorScheme.fromSwatch());

  static ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(backgroundColor: LightColors.green2, elevation: 0),
    primaryColor: LightColors.green2,
    accentColor: LightColors.green2,
    backgroundColor: LightColors.green1,
    scaffoldBackgroundColor: LightColors.black4,
    cardColor: LightColors.black1,
    canvasColor: LightColors.black2,
    disabledColor: LightColors.black3,
    errorColor: LightColors.red,
  );
}

getThemeMode(BuildContext context) {
  return Provider.of<ThemeProvider>(context).themeMode;
}
