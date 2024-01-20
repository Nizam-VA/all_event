import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  GoogleSignIn googleSignIn = GoogleSignIn();
  Future<Either<String, UserCredential>> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setBool('LOGIN', true);

      return right(userCredential);
    } catch (e) {
      print(e);
      return left(e.toString());
    }
  }

  Future signOutOfGoogle(BuildContext context) async {
    try {
      googleSignIn.signOut();
    } catch (e) {
      final snackBar = SnackBar(
        content: Text(
          '$e',
          style: TextStyle(
            color: Colors.white,
            backgroundColor: Colors.red[900],
          ),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
