import 'package:firebase_auth/firebase_auth.dart';

class SignUpRepo{

  static Future<UserCredential> firebaseSignUp(String email, String password) async {
    var credentials = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email, password: password
    );
    return credentials;
  }
}