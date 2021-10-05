import 'package:flutter/material.dart';
import 'package:musi_chat/constants/appHeading.dart';
import 'package:musi_chat/constants/colors.dart';
import 'package:musi_chat/provider/themeProvider.dart';

class ChatsHome extends StatefulWidget {
  @override
  _ChatsHomeState createState() => _ChatsHomeState();
}

class _ChatsHomeState extends State<ChatsHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: AppHeading(),
        ),
      ),
    );
  }
}
