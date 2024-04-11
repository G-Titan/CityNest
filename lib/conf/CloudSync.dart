// ignore_for_file: use_build_context_synchronously, file_names

import 'package:citynest/conf/persona.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:citynest/life/POWER.dart';
import 'package:citynest/main_screen.dart'; //Unused import for logout scenarios

/*NOTES
 THESE COMMENTED IMPORTS CONTRIBUTE TO INITIALIZING FIREBASE, it
 is STRONGLY & HIGHLY advisable that you MUST initialize it first elsewhere before using these functions
 
 this file may be used in other projects as long as the appropriate controllers are made and instantiated 
 in the file with the form*/

//import 'package:citynest/firebase_options.dart';
//import 'package:firebase_core/firebase_core.dart';

class CloudSync {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final FirebaseDatabase _database = FirebaseDatabase.instance;

  // Function to handle authentication state changes
  static void authenticationState(BuildContext context) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
        // Perform any actions needed when the user is signed out
        // Navigate to the main screen after successful sign-out
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const MainScreen()),
        );
      } else {
        print('User is signed in!');
        // Perform any actions needed when the user is signed in
        // Navigate after success
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const Power()));
      }
    });
  }

  static Future<void> signOut(BuildContext context) async {
    try {
      await _auth.signOut();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('User signed out successfully'),
          duration: Duration(seconds: 5),
        ),
      );
      // Navigate to the main screen after successful sign-out
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const MainScreen()),
      );
    } catch (e) {
      print('Error signing out: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('An error occurred while signing out'),
          duration: Duration(seconds: 5),
        ),
      );
    }
  }

  static String _getFriendlyErrorMessage(FirebaseAuthException e) {
    if (e.code == 'weak-password') {
      return 'Use a stronger password.';
    } else if (e.code == 'email-already-in-use') {
      return 'I know this email, try login instead.';
    } else if (e.code == 'user-not-found') {
      return 'I don\'t know that email, Register instead.';
    } else if (e.code == 'wrong-password') {
      return 'Password incorrect, try a different one.';
    } else {
      return 'Check your login information or internet & try again.';
    }
  }

  // Function for basic user registration with email and password
  static Future<void> registerUserBasic(
      BuildContext context, String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      String userId = userCredential.user!.uid; // Obtain Firebase Auth UID
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('User registration successful'),
            duration: Duration(seconds: 7)),
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
              duration: const Duration(seconds: 6)),
        );
      }
    }
  }
// This would ideally be called after the basic registration, passing Firebase Auth's UID as userId

  static void registerUserDetails(
      BuildContext context,
      String userId,
      String name,
      String surname,
      int age,
      String idNumber,
      String homeAddress,
      String phoneNumber,
      String citizenship,
      String gender,
      String birthDate) {
    try {
      // Reference to the user's node in the database
      DatabaseReference userRef = _database
          .ref()
          .child('users')
          .child(userId); // Reference to the user's node in the database

      // Push user details to the database
      userRef.set({
        'name': name,
        'surname': surname,
        'age': age,
        'idNumber': idNumber,
        'homeAddress': homeAddress,
        'phoneNumber': phoneNumber,
        'citizenship': citizenship,
        'gender': gender,
        'birthDate': birthDate,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('User registration successful'),
          duration: Duration(seconds: 7),
        ),
      );

      // Optionally, navigate to the next screen after successful registration
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const Power()),
      );
    } catch (e) {
      print('Error registering user details: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('An error occurred while registering user details'),
          duration: Duration(seconds: 5),
        ),
      );
    }
  }

  static Future<void> signInUser(
      BuildContext context, String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('sign-in successful'),
            duration: Duration(seconds: 5)),
      );
      // Navigate after success
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const Power()));
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
