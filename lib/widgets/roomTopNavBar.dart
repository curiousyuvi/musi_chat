import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:musi_chat/constants/colors.dart';
import 'package:musi_chat/constants/enums.dart';
import 'package:musi_chat/provider/themeProvider.dart';
import 'package:rive/rive.dart';

class RoomTopNavBar extends StatelessWidget {
  RoomScreenType currentScreen;
  void Function()? onTap;
  bool isPlaying;

  RoomTopNavBar(
      {this.currentScreen = RoomScreenType.chat,
      this.onTap,
      this.isPlaying = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(color: Theme.of(context).primaryColor, child: Divider()),
        Container(
          padding: EdgeInsets.all(0),
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              // boxShadow: [
              //   BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 10)
              // ],
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
          height: 50,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: onTap,
                child: Container(
                  color: Theme.of(context).primaryColor.withOpacity(0),
                  height: double.infinity,
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Center(
                    child: FaIcon(
                      FontAwesomeIcons.solidCommentDots,
                      color: currentScreen == RoomScreenType.chat
                          ? LightColors.white1
                          : Theme.of(context).accentColor,
                      size: 25,
                    ),
                  ),
                ),
              ),
              VerticalDivider(),
              GestureDetector(
                onTap: onTap,
                child: Container(
                  color: Theme.of(context).primaryColor.withOpacity(0),
                  height: double.infinity,
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Center(
                    child: isPlaying
                        ? RiveAnimation.asset('riveAssets/music_wave_light.riv')
                        : FaIcon(
                            FontAwesomeIcons.music,
                            color: currentScreen == RoomScreenType.song
                                ? LightColors.white1
                                : Theme.of(context).accentColor,
                            size: 25,
                          ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
