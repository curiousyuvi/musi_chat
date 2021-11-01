import 'package:flutter/material.dart';
import 'package:musi_chat/constants/enums.dart';

class BigButton extends StatelessWidget {
  const BigButton(
      {this.onPressed,
      this.label = 'Button',
      this.bigButtonType = BigButtonType.primary});

  final void Function()? onPressed;
  final String label;
  final BigButtonType bigButtonType;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.all(0),
      onPressed: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: bigButtonType == BigButtonType.primary
              ? Theme.of(context).primaryColor
              : Theme.of(context).backgroundColor,
        ),
        padding: EdgeInsets.all(10),
        width: double.infinity,
        child: Center(
          child: Text(
            label,
            style: Theme.of(context).textTheme.headline1!.copyWith(
                fontSize: 20, color: Theme.of(context).scaffoldBackgroundColor),
          ),
        ),
      ),
    );
  }
}
