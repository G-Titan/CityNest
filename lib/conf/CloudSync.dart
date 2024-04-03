// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

  static Future<void> registerUser(
      BuildContext context, String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // If registration is successful, show a success Snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('User registration successful'),
          duration: Duration(seconds: 5),
        ),
      );
    } catch (e) {
      // If registration fails, show an error Snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('User registration failed: $e'),
          duration: const Duration(seconds: 5),
        ),
      );
    }
  }

  static Future<void> signInUser(
      BuildContext context, String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // If sign-in is successful, show a success Snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('User sign-in successful'),
          duration: Duration(seconds: 2),
        ),
      );
    } catch (e) {
      // If sign-in fails, show an error Snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('User sign-in failed: $e'),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }
}
