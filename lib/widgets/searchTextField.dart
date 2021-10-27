import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.symmetric(horizontal: 15),
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(
            FontAwesomeIcons.search,
            color: Theme.of(context).accentColor,
            size: 20,
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
              child: TextFormField(
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
                hintText: 'Search'),
          ))
        ],
      ),
    );
  }
}
