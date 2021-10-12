import 'package:flutter/widgets.dart';

class PlayProvider extends ChangeNotifier {
  bool isPlaying = false;

  void TogglePlayPause() {
    isPlaying = isPlaying ? false : true;
    notifyListeners();
  }
}
