import 'package:flutter/material.dart';
import 'package:musi_chat/constants/colors.dart';
import 'package:musi_chat/widgets/otpCard.dart';
import 'package:musi_chat/widgets/phoneNumberCard.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  PageController pageViewController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
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
                    'Register',
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
                    'Register using your phone number and verify the OTP you received',
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
                  children: [PhoneNumberCard(), OTPCard()],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
