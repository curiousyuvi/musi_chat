import 'package:flutter/material.dart';
import 'package:musi_chat/constants/enums.dart';
import 'package:musi_chat/objects/person.dart';
import 'package:musi_chat/routes/heroDialogRoute.dart';
import 'package:musi_chat/widgets/PopUpAvatar.dart';

class ChatListTile extends StatelessWidget {
  String imageUrl;
  String name;
  String lastChat;
  String time;

  ChatListTile(
      {this.imageUrl =
          'https://cdn.britannica.com/q:60/91/181391-050-1DA18304/cat-toes-paw-number-paws-tiger-tabby.jpg',
      this.name = 'Name Of User',
      this.lastChat = 'Last chat with user',
      this.time = '12:00 AM'});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, "/chat",
                arguments: Person(name: name, imageUrl: imageUrl));
          },
          child: Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Row(
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          HeroDialogRoute(builder: (context) {
                        return Center(
                          child: PopUpAvatar(
                            imageUrl: imageUrl,
                            name: name,
                            popUpType: PopUpAvatarType.dialog,
                          ),
                        );
                      }));
                    },
                    child: PopUpAvatar(
                      name: name,
                      imageUrl: imageUrl,
                    )),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      Text(
                        lastChat,
                        style: Theme.of(context).textTheme.bodyText2,
                      )
                    ],
                  ),
                ),
                Text(
                  time,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.copyWith(fontSize: 18),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Divider(
          color: Theme.of(context).cardColor,
        )
      ],
    );
  }
}
