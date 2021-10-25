import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:musi_chat/constants/colors.dart';

class SentMessageTile extends StatelessWidget {
  String messageBody;

  SentMessageTile({this.messageBody = 'Lorem Ipsum'});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Bubble(
            alignment: Alignment.centerRight,
            showNip: true,
            nip: BubbleNip.rightTop,
            nipRadius: 2,
            color: Theme.of(context).canvasColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: Text(
                messageBody,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: LightColors.white1),
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
