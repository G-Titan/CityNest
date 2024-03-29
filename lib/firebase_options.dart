// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAqJFhDNZaygZaSjw3rIWLi4ukVA2pXXJE',
    appId: '1:215867759293:web:58bec524dca6887378f5d4',
    messagingSenderId: '215867759293',
    projectId: 'citynest-e6393',
    authDomain: 'citynest-e6393.firebaseapp.com',
    storageBucket: 'citynest-e6393.appspot.com',
    measurementId: 'G-WS68F3DFG4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCAQS-ZiDlunmlbQ1Jz8xUw6D4zYhc6dgk',
    appId: '1:215867759293:android:598f4db85144a43378f5d4',
    messagingSenderId: '215867759293',
    projectId: 'citynest-e6393',
    storageBucket: 'citynest-e6393.appspot.com',
  );
}
