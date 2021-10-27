import 'package:firebase_auth/firebase_auth.dart';

var _auth = FirebaseAuth.instance;
Future<bool> login(String verificationId, String otp) async {
  final _phoneAuthCredential = PhoneAuthProvider.credential(
      verificationId: verificationId, smsCode: otp);
  try {
    await _auth.signInWithCredential(_phoneAuthCredential);
  } catch (e) {
    print(e);
  }

  if (_auth.currentUser == null) {
    print('Authentication Failed');
    return false;
  } else {
    print('Authentication Success:');
    print(_auth.currentUser!.phoneNumber);
    return true;
  }
}
