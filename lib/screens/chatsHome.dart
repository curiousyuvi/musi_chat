import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:musi_chat/constants/appHeading.dart';
import 'package:musi_chat/constants/colors.dart';
import 'package:musi_chat/provider/themeProvider.dart';
import 'package:musi_chat/widgets/changeThemeButton.dart';

class ChatsHome extends StatefulWidget {
  @override
  _ChatsHomeState createState() => _ChatsHomeState();
}

class _ChatsHomeState extends State<ChatsHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox.shrink(),
        title: Center(
          child: AppHeading(),
        ),
        actions: [
          Center(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 2),
                        blurRadius: 5,
                        color: Colors.black.withOpacity(0.3))
                  ]),
              child: CircleAvatar(
                backgroundColor: Theme.of(context).accentColor,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColor,
                    child: Icon(
                      Icons.settings_outlined,
                      size: 25,
                      color: Theme.of(context).shadowColor,
                    ),
                  ),
                ),
              ),
            ),
          ))
        ],
      ),
      body: Center(
        child: ChangeThemeButtonWidget(),
      ),
    );
  }
}
