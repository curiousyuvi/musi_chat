import 'package:flutter/material.dart';
import 'package:musi_chat/provider/themeProvider.dart';
import 'package:provider/provider.dart';

//Theme Switcher Toggle Button
class ChangeThemeButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Switch.adaptive(
        value: themeProvider.isDarkMode,
        onChanged: (val) {
          final provider = Provider.of<ThemeProvider>(context, listen: false);
          provider.toggleTheme(val);
        });
  }
}
