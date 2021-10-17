import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:musi_chat/provider/playProvider.dart';
import 'package:musi_chat/widgets/playerBottomBar.dart';
import 'package:musi_chat/widgets/searchTextField.dart';
import 'package:provider/provider.dart';

class SongScreen extends StatefulWidget {
  @override
  _SongScreenState createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen>
    with AutomaticKeepAliveClientMixin<SongScreen> {
  double sliderValue = 0;

  @override
  Widget build(BuildContext context) {
    final playProvider = Provider.of<PlayProvider>(context);

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
                Expanded(
                    child: ListView(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.width * 0.2,
                          child: Row(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.2,
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage('assets')),
                                      ))
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ))
              ],
            ),
          ),
        ),
        PlayerBottomBar(
            sliderValue: sliderValue,
            isPlaying: playProvider.isPlaying,
            onSliderValChanged: (val) {
              setState(() {
                sliderValue = val;
              });
            })
      ],
    ));
  }

  @override
  bool get wantKeepAlive => true;
}
