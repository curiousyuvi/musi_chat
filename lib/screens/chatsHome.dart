import 'package:flutter/material.dart';
import 'package:musi_chat/widgets/changeThemeButton.dart';
import 'package:musi_chat/widgets/chatsHomeAppBar.dart';

class ChatsHome extends StatefulWidget {
  @override
  _ChatsHomeState createState() => _ChatsHomeState();
}

class _ChatsHomeState extends State<ChatsHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: ChatsHomeAppBar()),
      body: Center(
        child: ChangeThemeButtonWidget(),
      ),
    );
  }
}
