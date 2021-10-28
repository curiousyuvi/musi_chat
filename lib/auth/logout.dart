import 'package:firebase_auth/firebase_auth.dart';

var _auth = FirebaseAuth.instance;

Future<bool> logout() async {
  try {
    await _auth.signOut();
    print("Signout Success");
    return true;
  } catch (e) {
    print(e);
    return false;
  }
}
