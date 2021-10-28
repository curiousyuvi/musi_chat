import 'package:firebase_auth/firebase_auth.dart';

var _auth = FirebaseAuth.instance;

bool isLoggedIn() {
  bool result = _auth.currentUser != null;
  return result;
}
