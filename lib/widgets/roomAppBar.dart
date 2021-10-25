import 'package:flutter/material.dart';
import 'package:musi_chat/constants/colors.dart';
import 'package:musi_chat/constants/enums.dart';
import 'package:musi_chat/routes/heroDialogRoute.dart';
import 'package:musi_chat/widgets/PopUpAvatar.dart';

class RoomAppBar extends StatelessWidget {
  String name, imageUrl;
  RoomAppBar({this.name = '', this.imageUrl = ''});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context, HeroDialogRoute(builder: (context) {
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
              popUpType: PopUpAvatarType.avatar,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(color: LightColors.white1),
              ),
              Text(
                'Seen 1 hour ago',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: LightColors.white1),
              )
            ],
          ),
          SizedBox(
            width: 44,
          )
        ],
      ),
    );
  }
}
