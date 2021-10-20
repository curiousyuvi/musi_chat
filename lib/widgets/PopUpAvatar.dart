import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:musi_chat/constants/enums.dart';

class PopUpAvatar extends StatelessWidget {
  String imageUrl, name;
  PopUpAvatarType popUpType;
  PopUpAvatar(
      {this.imageUrl = '',
      this.name = '',
      this.popUpType = PopUpAvatarType.avatar});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'avatarDialog' + name + imageUrl,
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    height: popUpType == PopUpAvatarType.dialog ? 250 : 50,
                    width: popUpType == PopUpAvatarType.dialog ? 250 : 50,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(imageUrl), fit: BoxFit.cover),
                        borderRadius: popUpType == PopUpAvatarType.dialog
                            ? BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10))
                            : BorderRadius.circular(100)),
                  ),
                  popUpType == PopUpAvatarType.dialog
                      ? Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                          decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .scaffoldBackgroundColor
                                  .withOpacity(0.4),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10))),
                          width: 250,
                          child: Text(name,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                  )),
                        )
                      : SizedBox.shrink()
                ],
              ),
              popUpType == PopUpAvatarType.dialog
                  ? Container(
                      padding: EdgeInsets.all(6),
                      width: 250,
                      decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                            child: Icon(
                              Icons.message,
                              size: 28,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          Flexible(
                            child: Icon(
                              Icons.info_outline,
                              size: 28,
                              color: Theme.of(context).primaryColor,
                            ),
                          )
                        ],
                      ),
                    )
                  : SizedBox.shrink()
            ],
          ),
        ),
      ),
    );
  }
}
