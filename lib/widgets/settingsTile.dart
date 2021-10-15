import 'package:flutter/material.dart';

class SettingsTile extends StatelessWidget {
  Widget leading;
  String heading, subHeading;
  SettingsTile(
      {this.leading = const SizedBox.shrink(),
      this.heading = 'Heading',
      this.subHeading = 'Sub-Heading'});

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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      heading,
                      style: Theme.of(context).textTheme.bodyText1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(subHeading,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText2),
                  ],
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
