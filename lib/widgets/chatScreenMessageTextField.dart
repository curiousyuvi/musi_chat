import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_icons/line_icons.dart';

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
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(horizontal: 18),
        child: Row(
          children: [
            Expanded(
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
            ),
            SizedBox(
              width: 15,
            ),
            isTyping
                ? GestureDetector(
                    onTap: onSendClick,
                    child: FaIcon(
                      FontAwesomeIcons.solidArrowAltCircleRight,
                      color: Theme.of(context).primaryColor,
                      size: 30,
                    ),
                  )
                : Row(
                    children: [
                      GestureDetector(
                        onTap: onAttachmentClick,
                        child: Icon(
                          Icons.emoji_emotions,
                          color: Theme.of(context).primaryColor,
                          size: 25,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: onAttachmentClick,
                        child: FaIcon(
                          FontAwesomeIcons.solidImage,
                          color: Theme.of(context).primaryColor,
                          size: 25,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: onAttachmentClick,
                        child: FaIcon(
                          FontAwesomeIcons.paperclip,
                          color: Theme.of(context).primaryColor,
                          size: 22,
                        ),
                      ),
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
