import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(color: Theme.of(context).primaryColor),
          height: 50,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: onTap,
                child: Container(
                  color: Theme.of(context).primaryColor,
                  height: double.infinity,
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Center(
                    child: FaIcon(
                      FontAwesomeIcons.solidCommentDots,
                      size: 25,
                    ),
                  ),
                ),
              ),
              VerticalDivider(),
              GestureDetector(
                onTap: onTap,
                child: Container(
                  color: Theme.of(context).primaryColor,
                  height: double.infinity,
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Center(
                    child: isPlaying
                        ? getThemeMode(context) == ThemeMode.dark
                            ? RiveAnimation.asset(
                                'riveAssets/music_wave_light.riv')
                            : RiveAnimation.asset(
                                'riveAssets/music_wave_dark.riv')
                        : FaIcon(
                            FontAwesomeIcons.music,
                            size: 25,
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          child: Row(
            children: [
              Expanded(
                  child: Container(
                height: 8,
                color: currentScreen == RoomScreenType.chat
                    ? Theme.of(context).accentColor
                    : Theme.of(context).primaryColor,
              )),
              Expanded(
                  child: Container(
                height: 8,
                color: currentScreen == RoomScreenType.song
                    ? Theme.of(context).accentColor
                    : Theme.of(context).primaryColor,
              ))
            ],
          ),
        )
      ],
    );
  }
}
