import 'package:flutter/material.dart';
import 'package:musi_chat/auth/logout.dart';

class SettingsSignOutTile extends StatefulWidget {
  final Widget leading;
  final String heading;
  SettingsSignOutTile(
      {this.leading = const SizedBox.shrink(), this.heading = 'Heading'});

  @override
  _SettingsSignOutTileState createState() => _SettingsSignOutTileState();
}

class _SettingsSignOutTileState extends State<SettingsSignOutTile> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () async {
            setState(() {
              isLoading = true;
            });

            var hasLoggedout = await logout();

            if (hasLoggedout) {
              Navigator.pushNamed(context, "/login");
            }
            setState(() {
              isLoading = false;
            });
          },
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Theme.of(context).errorColor.withOpacity(0.15),
                borderRadius: BorderRadius.circular(10)),
            child: isLoading
                ? Container(
                    height: 60,
                    width: double.infinity,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Theme.of(context).errorColor,
                        strokeWidth: 6,
                      ),
                    ),
                  )
                : Row(
                    children: [
                      Container(
                          height: 60,
                          width: 60,
                          child: Center(child: widget.leading)),
                      SizedBox(
                        width: 50,
                      ),
                      Expanded(
                        child: Text(
                          widget.heading,
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
        ),
        Divider(
          color: Theme.of(context).cardColor,
        )
      ],
    );
  }
}
