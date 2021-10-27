import 'package:firebase_auth/firebase_auth.dart';

var _auth = FirebaseAuth.instance;

Future<void> sendOTP(
    String phoneNumberWithCountryCode,
    Function(FirebaseAuthException) verificationFailed,
    Function(String, int?) codeSent,
    Function(String) codeAutoRetrievalTimeout) async {
  await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumberWithCountryCode,
      verificationCompleted: (PhoneAuthCredential) async {},
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
}
