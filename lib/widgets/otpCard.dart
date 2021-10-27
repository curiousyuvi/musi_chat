import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class OTPCard extends StatelessWidget {
  final void Function(String?)? onOTPCompleted;
  final void Function()? onVerifyOTPPressed;

  OTPCard({this.onOTPCompleted, this.onVerifyOTPPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: OTPTextField(
                onCompleted: onOTPCompleted,
                outlineBorderRadius: 5,
                fieldWidth: 50,
                length: 6,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 12),
                fieldStyle: FieldStyle.box,
                margin: EdgeInsets.all(0),
                otpFieldStyle: OtpFieldStyle(
                    backgroundColor: Theme.of(context).backgroundColor),
              )),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          MaterialButton(
            padding: EdgeInsets.all(0),
            onPressed: onVerifyOTPPressed,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).primaryColor,
              ),
              padding: EdgeInsets.all(8),
              width: double.infinity,
              child: Center(
                child: Text(
                  'Verify OTP',
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                      fontSize: 25,
                      color: Theme.of(context).scaffoldBackgroundColor),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
