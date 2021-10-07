import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:musi_chat/constants/colors.dart';
import 'package:musi_chat/provider/themeProvider.dart';
import 'package:musi_chat/screens/roomScreen.dart';
import 'package:musi_chat/screens/settingsScreen.dart';
import 'package:provider/provider.dart';
import 'screens/chatsHomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (context, _) {
          final themeProvider = Provider.of<ThemeProvider>(context);

          //To force stop screen rotation
          SystemChrome.setPreferredOrientations(
              [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

          //To change the system Navigation bar color according to the theme
          SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
              systemNavigationBarColor:
                  themeProvider.themeMode == ThemeMode.dark
                      ? DarkColors.black1
                      : LightColors.white1));

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: {
              "/": (context) {
                return ChatsHomeScreen();
              },
              "/settings": (context) {
                return SettingsScreen();
              },
              "/chat": (context) {
                return RoomScreen();
              },
            },
            theme: MyThemes.lightTheme,
            darkTheme: MyThemes.darkTheme,
            themeMode: themeProvider.themeMode,
            initialRoute: "/",
          );
        });
  }
}
