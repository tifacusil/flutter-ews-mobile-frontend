// File generated from google-services.json via firebase_options.dart pattern.
// Update this file when the Firebase project changes.

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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web — '
        'reconfigure with FlutterFire CLI.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for iOS — '
          'add a GoogleService-Info.plist and reconfigure with FlutterFire CLI.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macOS — '
          'reconfigure with FlutterFire CLI.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for Windows — '
          'reconfigure with FlutterFire CLI.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for Linux — '
          'reconfigure with FlutterFire CLI.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCKLcsWaffv3k3LsEkIwouzFpUTr5PNXhU',
    appId: '1:426668129322:android:408e9ef101281890175753',
    messagingSenderId: '426668129322',
    projectId: 'early-warning-6c2f0',
    storageBucket: 'early-warning-6c2f0.firebasestorage.app',
  );
}
