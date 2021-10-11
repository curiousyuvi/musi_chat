import 'package:flutter/material.dart';
import 'package:musi_chat/widgets/chatScreenMessageTextField.dart';
import 'package:musi_chat/widgets/dateUpdateTile.dart';
import 'package:musi_chat/widgets/receivedMessageTile.dart';
import 'package:musi_chat/widgets/sentMessageTile.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        children: [
          Expanded(
              child: Container(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: ListView(
              children: [
                DateUpdateTile(messageBody: 'Tuesday, 2021'),
                SentMessageTile(messageBody: 'Hi'),
                ReceivedMessageTile(messageBody: 'Hello!!'),
              ],
            ),
          )),
          ChatScreenMessageTextField()
        ],
      ),
    ));
  }
}
