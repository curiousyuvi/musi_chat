import 'package:flutter/material.dart';

class SettingsSignOutTile extends StatelessWidget {
  Widget leading;
  String heading;
  SettingsSignOutTile(
      {this.leading = const SizedBox.shrink(), this.heading = 'Heading'});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          child: Row(
            children: [
              Container(height: 60, width: 60, child: Center(child: leading)),
              SizedBox(
                width: 50,
              ),
              Expanded(
                child: Text(
                  heading,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: Theme.of(context).errorColor),
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        ),
        Divider(
          color: Theme.of(context).cardColor,
        )
      ],
    );
  }
}
