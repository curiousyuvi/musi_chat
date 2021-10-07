import 'package:flutter/material.dart';
import 'package:musi_chat/widgets/chatScreenMessageTextField.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

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
            child: Center(),
          ),
          ChatScreenMessageTextField()
        ],
      ),
    ));
  }
}
