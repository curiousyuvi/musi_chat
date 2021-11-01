import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:musi_chat/constants/enums.dart';

class DecoratedTextFormField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final DecoratedTextFieldType type;
  DecoratedTextFormField(
      {this.hintText = 'hint',
      this.icon = FontAwesomeIcons.smile,
      this.onChanged,
      this.validator,
      this.type = DecoratedTextFieldType.oneLine});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          type == DecoratedTextFieldType.oneLine
              ? Row(
                  children: [
                    FaIcon(
                      icon,
                      color: Theme.of(context).accentColor,
                      size: 20,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                )
              : SizedBox.shrink(),
          Expanded(
              child: TextFormField(
            validator: validator,
            onChanged: onChanged,
            cursorColor: Theme.of(context).shadowColor,
            maxLines: 1,
            maxLength: type == DecoratedTextFieldType.oneLine ? null : 50,
            textAlignVertical: TextAlignVertical.center,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: type == DecoratedTextFieldType.oneLine ? 18 : 15),
            decoration: InputDecoration(
                counterStyle: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontSize: 10),
                border: OutlineInputBorder(borderSide: BorderSide.none),
                contentPadding: EdgeInsets.zero,
                hintStyle: Theme.of(context).textTheme.bodyText2?.copyWith(
                    fontSize: type == DecoratedTextFieldType.oneLine ? 18 : 15),
                hintText: hintText),
          ))
        ],
      ),
    );
  }
}
