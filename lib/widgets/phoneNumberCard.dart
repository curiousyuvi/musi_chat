import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

class PhoneNumberCard extends StatelessWidget {
  final void Function()? onGetOTPPressed;
  final void Function(String?)? onNumberChanged;
  final void Function(CountryCode?)? onCountryCodeChanged;

  PhoneNumberCard(
      {this.onGetOTPPressed, this.onNumberChanged, this.onCountryCodeChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.symmetric(horizontal: 5),
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CountryCodePicker(
                  onChanged: onCountryCodeChanged,
                  initialSelection: 'In',
                  favorite: ['In'],
                  showDropDownButton: true,
                  showFlag: false,
                  textStyle: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 30),
                  searchStyle: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 18),
                  boxDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).backgroundColor),
                  padding: EdgeInsets.all(0),
                ),
                Expanded(
                    child: TextFormField(
                  onChanged: onNumberChanged,
                  keyboardType: TextInputType.phone,
                  cursorColor: Theme.of(context).shadowColor,
                  maxLines: 1,
                  maxLength: 10,
                  textAlignVertical: TextAlignVertical.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 30, letterSpacing: 1),
                  decoration: InputDecoration(
                      counterText: "",
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      contentPadding: EdgeInsets.zero,
                      hintStyle: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(letterSpacing: 1, fontSize: 30),
                      hintText: "88XXXXXXXX"),
                ))
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          MaterialButton(
            padding: EdgeInsets.all(0),
            onPressed: onGetOTPPressed,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).primaryColor,
              ),
              padding: EdgeInsets.all(8),
              width: double.infinity,
              child: Center(
                child: Text(
                  'Get OTP',
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
