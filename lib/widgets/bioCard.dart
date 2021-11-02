import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:musi_chat/constants/enums.dart';

import 'bigButton.dart';
import 'decoratedTextFormField.dart';

class BioCard extends StatefulWidget {
  final GlobalKey<FormState>? bioFormKey;
  final void Function(String?)? onChanged;
  final void Function()? onPressed;
  final void Function()? onBackPressed;
  final void Function()? onSkipPressed;

  BioCard(
      {this.bioFormKey,
      this.onChanged,
      this.onPressed,
      this.onBackPressed,
      this.onSkipPressed});

  @override
  _BioCardState createState() => _BioCardState();
}

class _BioCardState extends State<BioCard>
    with AutomaticKeepAliveClientMixin<BioCard> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Write a short Bio'),
        SizedBox(
          height: 5,
        ),
        Form(
          key: widget.bioFormKey,
          child: DecoratedTextFormField(
            icon: FontAwesomeIcons.user,
            hintText: 'Hey there, I\'m on Musi Chat',
            type: DecoratedTextFieldType.multiLine,
            validator: (val) {
              return val!.isEmpty ? 'Bio should not be empty' : null;
            },
            onChanged: widget.onChanged,
          ),
        ),
        SizedBox(
          height: 25,
        ),
        Row(
          children: [
            Expanded(
              child: BigButton(
                bigButtonType: BigButtonType.secondary,
                label: "Skip",
                onPressed: widget.onSkipPressed,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: BigButton(
                label: "Next",
                onPressed: widget.onPressed,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        MaterialButton(
            onPressed: widget.onBackPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                FaIcon(
                  FontAwesomeIcons.angleLeft,
                  color: Theme.of(context).shadowColor,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Back',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ))
      ],
    );
  }
}
