import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void showErrorSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Theme.of(context).errorColor,
      content: Row(
        children: [
          FaIcon(FontAwesomeIcons.timesCircle),
          SizedBox(
            width: 7,
          ),
          Text(
            'something went wrong',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      )));
}
