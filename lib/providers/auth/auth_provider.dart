import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

final authProvider =
    StateNotifierProvider<AuthProvider, User?>((ref) => AuthProvider());

class AuthProvider extends StateNotifier<User?> {
  AuthProvider() : super(FirebaseAuth.instance.currentUser) {
    FirebaseAuth.instance.userChanges().listen((User? user) {
      state = user;
    });
  }

  Future<void> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn(
              /*scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],*/
              )
          .signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      // Once signed in, return the UserCredential
      await FirebaseAuth.instance.signInWithCredential(credential);

      // state = FirebaseAuth.instance.currentUser;
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
