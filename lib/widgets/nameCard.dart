import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'bigButton.dart';
import 'decoratedTextFormField.dart';

class NameCard extends StatefulWidget {
  final GlobalKey<FormState>? nameFormKey;
  final void Function(String?)? onChanged;
  final void Function()? onPressed;

  NameCard({this.nameFormKey, this.onChanged, this.onPressed});

  @override
  _NameCardState createState() => _NameCardState();
}

class _NameCardState extends State<NameCard>
    with AutomaticKeepAliveClientMixin<NameCard> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Enter your name'),
        SizedBox(
          height: 5,
        ),
        Form(
          key: widget.nameFormKey,
          child: DecoratedTextFormField(
            icon: FontAwesomeIcons.user,
            hintText: 'John Doe',
            validator: (val) {
              return val!.isEmpty ? 'Name should not be empty' : null;
            },
            onChanged: widget.onChanged,
          ),
        ),
        SizedBox(
          height: 25,
        ),
        BigButton(
          label: "Next",
          onPressed: widget.onPressed,
        )
      ],
    );
  }
}
