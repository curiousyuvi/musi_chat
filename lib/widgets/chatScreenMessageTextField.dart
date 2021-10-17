import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChatScreenMessageTextField extends StatelessWidget {
  bool isTyping;
  TextEditingController? controller;
  void Function()? onSendClick;
  void Function(String)? onChanged;
  void Function()? onAttachmentClick;

  ChatScreenMessageTextField(
      {this.onSendClick,
      this.onAttachmentClick,
      this.controller,
      this.isTyping = false,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      width: double.infinity,
      color: Theme.of(context).primaryColor,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(100),
                border:
                    Border.all(color: Theme.of(context).shadowColor, width: 1)),
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: TextFormField(
              onChanged: onChanged,
              controller: controller,
              cursorColor: Theme.of(context).shadowColor,
              maxLines: 1,
              textAlignVertical: TextAlignVertical.center,
              style: Theme.of(context).textTheme.bodyText1,
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  contentPadding: EdgeInsets.zero,
                  hintStyle: Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.copyWith(fontSize: 20),
                  hintText: 'Send a message...'),
            ),
          )),
          SizedBox(
            width: 15,
          ),
          isTyping
              ? GestureDetector(
                  onTap: onSendClick,
                  child: FaIcon(
                    FontAwesomeIcons.solidArrowAltCircleRight,
                    size: 25,
                  ),
                )
              : GestureDetector(
                  onTap: onAttachmentClick,
                  child: FaIcon(
                    FontAwesomeIcons.paperclip,
                    size: 25,
                  ),
                )
        ],
      ),
    );
  }
}
