import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
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
          decoration: popUpType == PopUpAvatarType.dialog
              ? BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.black45.withOpacity(0.3),
                      blurRadius: 20,
                      spreadRadius: 5)
                ])
              : BoxDecoration(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    height: popUpType == PopUpAvatarType.dialog ? 250 : 45,
                    width: popUpType == PopUpAvatarType.dialog ? 250 : 45,
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
                      padding: EdgeInsets.all(8),
                      width: 250,
                      decoration: BoxDecoration(
                          color: Theme.of(context).backgroundColor,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                            child: Icon(
                              FontAwesomeIcons.solidCommentAlt,
                              size: 28,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          Flexible(
                            child: Icon(
                              FontAwesomeIcons.infoCircle,
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
