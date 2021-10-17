import 'package:flutter/material.dart';
import 'package:musi_chat/widgets/chatScreenMessageTextField.dart';
import 'package:musi_chat/widgets/dateUpdateTile.dart';
import 'package:musi_chat/widgets/receivedMessageTile.dart';
import 'package:musi_chat/widgets/sentMessageTile.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen>
    with AutomaticKeepAliveClientMixin<ChatScreen> {
  List<Widget> chatsWidgetList = [
    DateUpdateTile(messageBody: 'Tuesday, 2021'),
    SentMessageTile(messageBody: 'Hi'),
    ReceivedMessageTile(messageBody: 'Hello!!'),
  ];
  bool isTyping = false;
  TextEditingController? msgController = TextEditingController(text: "");
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
              children: List.from(chatsWidgetList.reversed),
              reverse: true,
            ),
          )),
          ChatScreenMessageTextField(
            isTyping: msgController!.text != "",
            onChanged: (val) {
              setState(() {});
            },
            controller: msgController,
            onSendClick: () {
              chatsWidgetList.add(SentMessageTile(
                messageBody: msgController!.text,
              ));

              msgController!.text = "";

              setState(() {});
            },
          )
        ],
      ),
    ));
  }

  @override
  bool get wantKeepAlive => true;
}
