import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:muse_chat/constants/colors.dart';
import 'package:muse_chat/provider/themeProvider.dart';
import 'package:muse_chat/screens/settings.dart';
import 'package:provider/provider.dart';

import 'screens/chatsHome.dart';

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

          SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
              systemNavigationBarColor:
                  themeProvider.themeMode == ThemeMode.dark
                      ? DarkColors.black1
                      : LightColors.black4));
          return MaterialApp(
            routes: {
              "/": (context) {
                return ChatsHome();
              },
              "/settings": (context) {
                return Settings();
              },
            },
            theme: MyThemes.lightTheme,
            darkTheme: MyThemes.darkTheme,
            themeMode: themeProvider.themeMode,
            initialRoute: "/settings",
          );
        });
  }
}
