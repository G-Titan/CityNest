// ignore: file_names
// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:citynest/Life/POWER.dart';
import 'package:citynest/conf/persona.dart';

/*NOTES
 THESE COMMENTED IMPORTS CONTRIBUTE TO INITIALIZING FIREBASE, it
 is STRONGLY & HIGHLY advisable that you MUST initialize it first elsewhere before using these functions
 
 this file may be used in other projects as long as the appropriate controllers are made and instantiated 
 in the file with the form*/

//import 'package:citynest/firebase_options.dart';
//import 'package:firebase_core/firebase_core.dart';

class CloudSettings {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

//static Future<void> SparkABlunt() async {
//  await Firebase.initializeApp(
//    options: DefaultFirebaseOptions.currentPlatform,
//  );
//  Ideal time to initialize emulator
//  await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
//}
/* The commented code above should be placed elsewhere before using the uncommented code below
 it is part of the auth flow */
  static String _getFriendlyErrorMessage(FirebaseAuthException e) {
    if (e.code == 'weak-password') {
      return 'The password provided is too weak.';
    } else if (e.code == 'email-already-in-use') {
      return 'Email already exists, log in instead.';
    } else if (e.code == 'user-not-found') {
      return 'Email not registered/ account doesnt exist';
    } else if (e.code == 'wrong-password') {
      return 'Wrong password, try again.';
    } else {
      return 'An unexpected error occurred. Please try again.';
    }
  }

  static Future<void> registerUser(
      BuildContext context, String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('User registration successful'),
            duration: Duration(seconds: 5)),
      );
      // Navigate after success
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const Persona()));
    } catch (e) {
      if (e is FirebaseAuthException) {
        final friendlyMessage = _getFriendlyErrorMessage(e);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(friendlyMessage),
              duration: const Duration(seconds: 7)),
        );
      }
    }
  }

  static Future<void> signInUser(
      BuildContext context, String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('User sign-in successful'),
            duration: Duration(seconds: 5)),
      );
      // Navigate after success
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => Power()));
    } catch (e) {
      if (e is FirebaseAuthException) {
        final friendlyMessage = _getFriendlyErrorMessage(e);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(friendlyMessage),
              duration: const Duration(seconds: 5)),
        );
      }
    }
  }
}
