import 'package:flutter/material.dart';

class RoomAppBar extends StatelessWidget {
  const RoomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: Theme.of(context).accentColor,
            child: CircleAvatar(
              radius: 20,
              foregroundImage: NetworkImage(
                  'https://cdn.britannica.com/q:60/91/181391-050-1DA18304/cat-toes-paw-number-paws-tiger-tabby.jpg'),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Anup CS',
                style: Theme.of(context).textTheme.headline1,
              ),
              Text(
                'Seen 1 hour ago',
                style: Theme.of(context).textTheme.bodyText2,
              )
            ],
          ),
          SizedBox(
            width: 44,
          )
        ],
      ),
    );
  }
}
