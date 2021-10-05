import 'package:flutter/material.dart';
import 'package:musi_chat/provider/themeProvider.dart';

import 'colors.dart';

class AppHeading extends StatelessWidget {
  const AppHeading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            width: 35,
            child: getThemeMode(context) == ThemeMode.dark
                ? Image.asset('assets/musichatLogoD.png')
                : Image.asset('assets/musichatLogoL.png')),
        Text(
          'Musi',
          style: TextStyle(
            color: getThemeMode(context) == ThemeMode.dark
                ? Colors.white
                : DarkColors.black1,
            fontFamily: 'BeautyMountain',
            fontSize: 35,
          ),
        ),
        Text(
          'Chat',
          style: TextStyle(
            color: getThemeMode(context) == ThemeMode.dark
                ? DarkColors.black1
                : Colors.white,
            fontFamily: 'BeautyMountain',
            fontSize: 35,
          ),
        )
      ],
    );
  }
}
