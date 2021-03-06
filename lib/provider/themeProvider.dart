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
          AppBarTheme(backgroundColor: DarkColors.black1, elevation: 0),
      iconTheme: IconThemeData(color: DarkColors.black5),
      primaryColor: DarkColors.green1,
      accentColor: DarkColors.green2,
      backgroundColor: DarkColors.green3,
      scaffoldBackgroundColor: DarkColors.black1,
      cardColor: DarkColors.black2,
      canvasColor: DarkColors.black3,
      disabledColor: DarkColors.black4,
      shadowColor: DarkColors.black5,
      errorColor: DarkColors.red,
      textTheme: TextTheme(
          headline1: TextStyle(
              color: DarkColors.black5,
              fontSize: 30,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold),
          headline2: TextStyle(
              color: DarkColors.black5,
              fontSize: 25,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold),
          headline3: TextStyle(
              color: DarkColors.black5,
              fontSize: 20,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold),
          bodyText1: TextStyle(
              color: DarkColors.black5, fontSize: 18, fontFamily: 'Poppins'),
          bodyText2: TextStyle(
              color: DarkColors.black5.withOpacity(0.5),
              fontSize: 15,
              fontFamily: 'Poppins')));

  static ThemeData lightTheme = ThemeData(
      appBarTheme:
          AppBarTheme(backgroundColor: LightColors.white1, elevation: 0),
      iconTheme: IconThemeData(color: LightColors.white5),
      primaryColor: LightColors.green1,
      accentColor: LightColors.green2,
      backgroundColor: LightColors.green3,
      scaffoldBackgroundColor: LightColors.white1,
      cardColor: LightColors.white2,
      canvasColor: LightColors.white3,
      disabledColor: LightColors.white4,
      shadowColor: LightColors.white5,
      errorColor: LightColors.red,
      textTheme: TextTheme(
          headline1: TextStyle(
              color: LightColors.white5,
              fontSize: 30,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold),
          headline2: TextStyle(
              color: LightColors.white5,
              fontSize: 25,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold),
          headline3: TextStyle(
              color: LightColors.white5,
              fontSize: 20,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold),
          bodyText1: TextStyle(
              color: LightColors.white5, fontSize: 18, fontFamily: 'Poppins'),
          bodyText2: TextStyle(
              color: LightColors.white5.withOpacity(0.5),
              fontSize: 15,
              fontFamily: 'Poppins')));
}

getThemeMode(BuildContext context) {
  return Provider.of<ThemeProvider>(context).themeMode;
}
