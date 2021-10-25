import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RoomsHomeAppBar extends StatelessWidget {
  const RoomsHomeAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 70,
      title: Center(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Messages',
              style: Theme.of(context).textTheme.headline1,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/settings");
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(5)),
                child: FaIcon(
                  FontAwesomeIcons.slidersH,
                  size: 20,
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
