import 'package:flutter/material.dart';
import 'package:musi_chat/widgets/changeThemeButton.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ChangeThemeButtonWidget(),
      ),
    );
  }
}
