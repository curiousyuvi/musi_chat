import 'package:flutter/material.dart';

class SettingsUserTile extends StatelessWidget {
  const SettingsUserTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(8),
          child: Row(
            children: [
              CircleAvatar(
                foregroundImage: NetworkImage(
                    'https://cdn.alfabetajuega.com/wp-content/uploads/2021/05/Yuji-Itadori1.jpg'),
                radius: 30,
              ),
              SizedBox(
                width: 50,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Yuvraj Singh',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text(
                    'Level up alone 😎',
                    style: Theme.of(context).textTheme.bodyText2,
                  )
                ],
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
