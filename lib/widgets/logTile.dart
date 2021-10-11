import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';

class LogTile extends StatelessWidget {
  String messageBody;

  LogTile({this.messageBody = 'Lorem Ipsum'});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Bubble(
        alignment: Alignment.center,
        showNip: false,
        color: Theme.of(context).disabledColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2.0),
          child: Text(
            messageBody,
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                fontSize: 12, color: Theme.of(context).scaffoldBackgroundColor),
          ),
        ),
      ),
    );
  }
}
