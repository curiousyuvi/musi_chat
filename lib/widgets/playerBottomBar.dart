import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:musi_chat/provider/sliderThemeProvider.dart';
import 'package:rive/rive.dart';

class PlayerBottomBar extends StatefulWidget {
  double sliderValue;
  bool isPlaying;
  PlayerBottomBar({this.sliderValue = 0, this.isPlaying = false});

  @override
  _PlayerBottomBarState createState() =>
      _PlayerBottomBarState(sliderValue: sliderValue);
}

class _PlayerBottomBarState extends State<PlayerBottomBar> {
  double sliderValue;
  bool isPlaying;

  _PlayerBottomBarState({this.sliderValue = 0, this.isPlaying = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).primaryColor),
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.width * 0.33,
                width: MediaQuery.of(context).size.width * 0.33,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          offset: Offset(10, 0),
                          blurRadius: 20)
                    ],
                    image: DecorationImage(
                        image: AssetImage('assets/badGuyCover.jpg'))),
              ),
              Container(
                height: MediaQuery.of(context).size.width * 0.33,
                width: MediaQuery.of(context).size.width * 0.33,
                color: Colors.black.withOpacity(0.5),
              ),
              Container(
                height: MediaQuery.of(context).size.width * 0.33,
                width: MediaQuery.of(context).size.width * 0.33,
                child: Center(
                  child: Container(
                    height: 70,
                    width: 70,
                    child: isPlaying
                        ? RiveAnimation.asset(
                            'riveAssets/music_wave_light.riv',
                          )
                        : Center(
                            child: FaIcon(
                            FontAwesomeIcons.playCircle,
                            size: 45,
                          )),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.02,
          ),
          Stack(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                height: MediaQuery.of(context).size.width * 0.33,
                width: MediaQuery.of(context).size.width * 0.65,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Billie Ellish - bad guy',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 15),
                    ),
                    Text(
                      'Billie Ellish',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          ?.copyWith(fontSize: 12),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          '01:43',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(fontSize: 12),
                        ),
                        Text(
                          '02:34',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(fontSize: 12),
                        )
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.stepBackward,
                          size: 15,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        isPlaying
                            ? FaIcon(
                                FontAwesomeIcons.solidPauseCircle,
                                size: 28,
                              )
                            : FaIcon(
                                FontAwesomeIcons.solidPlayCircle,
                                size: 28,
                              ),
                        SizedBox(
                          width: 20,
                        ),
                        FaIcon(
                          FontAwesomeIcons.stepForward,
                          size: 15,
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                height: MediaQuery.of(context).size.width * 0.33,
                width: MediaQuery.of(context).size.width * 0.65,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    SliderTheme(
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
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
