import 'package:flutter/material.dart';
import 'package:musi_chat/constants/appHeading.dart';

class ChatsHomeAppBar extends StatelessWidget {
  const ChatsHomeAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: SizedBox.shrink(),
      title: Center(
        child: AppHeading(),
      ),
      actions: [
        Center(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/settings");
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 2),
                        blurRadius: 5,
                        color: Colors.black.withOpacity(0.3))
                  ]),
              child: CircleAvatar(
                backgroundColor: Theme.of(context).accentColor,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColor,
                    child: Icon(
                      Icons.settings_outlined,
                      size: 25,
                      color: Theme.of(context).shadowColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ))
      ],
    );
  }
}
