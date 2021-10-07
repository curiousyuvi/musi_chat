import 'package:flutter/material.dart';
import 'package:musi_chat/constants/enums.dart';
import 'package:musi_chat/screens/chatScreen.dart';
import 'package:musi_chat/screens/songScreen.dart';
import 'package:musi_chat/widgets/roomAppBar.dart';
import 'package:musi_chat/widgets/roomTopNavBar.dart';

class RoomScreen extends StatefulWidget {
  @override
  _RoomScreenState createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  RoomScreenType currentScreen = RoomScreenType.chat;

  var chatScreenKey = GlobalKey<NavigatorState>();
  var songScreenKey = GlobalKey<NavigatorState>();

  var pageController = PageController(initialPage: 0);

  void changeScreen() {
    setState(() {
      if (currentScreen == RoomScreenType.chat) {
        currentScreen = RoomScreenType.song;
      } else {
        currentScreen = RoomScreenType.chat;
      }
    });
    pageController.animateToPage(currentScreen == RoomScreenType.chat ? 0 : 1,
        duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight), child: RoomAppBar()),
      body: Column(
        children: [
          RoomTopNavBar(
            currentScreen: currentScreen,
            onTap: changeScreen,
            isPlaying: true,
          ),
          Expanded(
            child: PageView(
              controller: pageController,
              onPageChanged: (i) {
                setState(() {
                  if (i == 0) {
                    currentScreen = RoomScreenType.chat;
                  } else {
                    currentScreen = RoomScreenType.song;
                  }
                });
              },
              children: [
                _buildOffstageNavigator(RoomScreenType.chat),
                _buildOffstageNavigator(RoomScreenType.song),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildOffstageNavigator(RoomScreenType screenType) {
    Widget child;
    if (screenType == RoomScreenType.chat)
      child = ChatScreen();
    else
      child = SongScreen();

    return Offstage(
        offstage: false,
        child: Navigator(
          key:
              screenType == RoomScreenType.chat ? chatScreenKey : songScreenKey,
          onGenerateRoute: (routeSettings) {
            return MaterialPageRoute(builder: (context) => child);
          },
        ));
  }
}
