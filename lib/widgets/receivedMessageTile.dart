import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';

class ReceivedMessageTile extends StatelessWidget {
  String messageBody;

  ReceivedMessageTile({this.messageBody = 'Lorem Ipsum'});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Bubble(
            alignment: Alignment.centerLeft,
            showNip: true,
            nip: BubbleNip.leftTop,
            nipRadius: 2,
            color: Theme.of(context).primaryColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: Text(
                messageBody,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            '02:00 PM',
            style:
                Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 13),
          )
        ],
      ),
    );
  }
}
