import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:musi_chat/widgets/playerBottomBar.dart';
import 'package:musi_chat/widgets/searchTextField.dart';

class SongScreen extends StatefulWidget {
  @override
  _SongScreenState createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
  double sliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                SearchTextField(),
                SizedBox(
                  height: 16,
                ),
                Expanded(child: ListView())
              ],
            ),
          ),
        ),
        PlayerBottomBar(
          sliderValue: sliderValue,
        )
      ],
    ));
  }
}



/*SliderTheme(
                      data: SliderThemeData(
                        trackHeight: 3,
                        trackShape: CustomTrackShape(),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 5.0),
                      ),
                      child: Slider(
                        min: 0.0,
                        max: 100.0,
                        activeColor: Theme.of(context).shadowColor,
                        inactiveColor:
                            Theme.of(context).shadowColor.withOpacity(0.3),
                        value: sliderValue,
                        label: 'Song',
                        onChanged: (val) {
                          setState(() {
                            sliderValue = val;
                          });
                        },
                      ),
                    ),*/ 