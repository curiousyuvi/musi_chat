import 'package:flutter/material.dart';
import 'package:musi_chat/auth/login.dart';
import 'package:musi_chat/constants/colors.dart';
import 'package:musi_chat/functions/showErrorSnackBar.dart';
import 'package:musi_chat/widgets/otpCard.dart';
import 'package:musi_chat/widgets/phoneNumberCard.dart';
import 'package:musi_chat/auth/sendOTP.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;
  String? phoneNumber = '';
  String? dialCountryCode = '+91';
  String otp = '';
  String verificationId = '';

  PageController pageViewController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  MediaQuery.of(context).viewInsets.bottom == 0
                      ? Column(
                          children: [
                            Container(
                                height: 150,
                                child: Image.asset('assets/musiChatIconG.png')),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'musi',
                                  style: TextStyle(
                                      color: DarkColors.green1,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Comfortaa',
                                      fontSize: 40),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'chat',
                                  style: TextStyle(
                                      color: DarkColors.black5,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Comfortaa',
                                      fontSize: 40),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Divider(
                              color: Theme.of(context).cardColor,
                              thickness: 2,
                              indent: 100,
                              endIndent: 100,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        )
                      : SizedBox.shrink(),
                  Column(
                    children: [
                      Text(
                        'Login',
                        textAlign: TextAlign.start,
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(fontSize: 40),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Login using your phone number and verify the OTP you received',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(fontSize: 15),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: PageView(
                      controller: pageViewController,
                      allowImplicitScrolling: false,
                      physics: new NeverScrollableScrollPhysics(),
                      children: [
                        PhoneNumberCard(
                          onNumberChanged: (phoneNumber) {
                            this.phoneNumber = phoneNumber;
                          },
                          onCountryCodeChanged: (countryCode) {
                            this.dialCountryCode = countryCode!.dialCode;
                          },
                          onGetOTPPressed: () {
                            setState(() {
                              isLoading = true;
                            });

                            final phoneNumberWithCountryCode =
                                "$dialCountryCode$phoneNumber";

                            print("Authenticating with" +
                                phoneNumberWithCountryCode);
                            sendOTP(phoneNumberWithCountryCode,
                                (verificationFailedError) {
                              setState(() {
                                isLoading = false;
                              });
                              print(verificationFailedError);
                              showErrorSnackBar(this.context);
                            }, (verificationId, resendingToken) {
                              pageViewController.animateToPage(1,
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.ease);
                              setState(() {
                                isLoading = false;
                                this.verificationId = verificationId;
                              });
                            }, (verificationId) {});
                          },
                        ),
                        OTPCard(
                          onOTPCompleted: (otp) {
                            this.otp = otp as String;
                            print(otp);
                          },
                          onVerifyOTPPressed: () async {
                            setState(() {
                              isLoading = true;
                            });
                            print("OTP: $otp");
                            final isLoggedIn = await login(verificationId, otp);
                            setState(() {
                              isLoading = false;
                            });

                            if (isLoggedIn) {
                              Navigator.pushNamed(context, "/");
                            } else {
                              showErrorSnackBar(this.context);
                            }
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            isLoading
                ? Center(
                    child: CircularProgressIndicator(
                      color: Theme.of(context).primaryColor,
                      strokeWidth: 6,
                    ),
                  )
                : SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
