import 'package:flutter/material.dart';
import 'package:musi_chat/widgets/chatListTile.dart';
import 'package:musi_chat/widgets/chatsHomeAppBar.dart';
import 'package:musi_chat/widgets/searchTextField.dart';

class RoomsHomeScreen extends StatefulWidget {
  @override
  _RoomsHomeScreenState createState() => _RoomsHomeScreenState();
}

class _RoomsHomeScreenState extends State<RoomsHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: RoomsHomeAppBar()),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                SearchTextField(),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView(
                    children: [
                      ChatListTile(
                        name: 'Anup CS',
                        lastChat: 'Aj college jaega?',
                      ),
                      ChatListTile(
                        name: 'Vivek CS',
                        lastChat: 'Aj college jaega?',
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
