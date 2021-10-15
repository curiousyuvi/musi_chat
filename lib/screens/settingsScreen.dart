import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:musi_chat/widgets/changeThemeButton.dart';
import 'package:musi_chat/widgets/settingsSignOutTile.dart';
import 'package:musi_chat/widgets/settingsTile.dart';
import 'package:musi_chat/widgets/settingsUserTile.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.settings_outlined,
              size: 26,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              'Settings',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 25),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SettingsUserTile(),
              SettingsTile(
                leading: ChangeThemeButtonWidget(),
                heading: 'Theme',
                subHeading: 'Switch between themes',
              ),
              SettingsTile(
                leading: FaIcon(FontAwesomeIcons.key),
                heading: 'Account',
                subHeading: 'Password change, Delete Account',
              ),
              SettingsTile(
                leading: FaIcon(FontAwesomeIcons.solidCommentAlt),
                heading: 'Chat',
                subHeading: 'Manage Chats',
              ),
              SettingsTile(
                leading: FaIcon(FontAwesomeIcons.cube),
                heading: 'About Developer',
                subHeading: 'Connect with the developer',
              ),
              SettingsSignOutTile(
                leading: FaIcon(
                  FontAwesomeIcons.signOutAlt,
                  color: Theme.of(context).errorColor,
                ),
                heading: 'Log Out',
              )
            ],
          ),
        ),
      ),
    );
  }
}
