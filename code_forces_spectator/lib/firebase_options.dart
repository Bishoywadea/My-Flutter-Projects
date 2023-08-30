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
        return ios;
      case TargetPlatform.macOS:
        return macos;
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
    apiKey: 'AIzaSyB6paGscpqnhw_WHo2HG49ZVs0S_yt7yY4',
    appId: '1:637584345010:web:02623eae0ad66c94d046ab',
    messagingSenderId: '637584345010',
    projectId: 'cfspec-92512',
    authDomain: 'cfspec-92512.firebaseapp.com',
    storageBucket: 'cfspec-92512.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDrsAlUNbX2ATr8uC2A5U7yMO6ZnqBGQF0',
    appId: '1:637584345010:android:a00e1974cb7a9730d046ab',
    messagingSenderId: '637584345010',
    projectId: 'cfspec-92512',
    storageBucket: 'cfspec-92512.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBlsg5PYDwYXG--_6e8yb20i0V091zHEq4',
    appId: '1:637584345010:ios:274f68a2d0a51941d046ab',
    messagingSenderId: '637584345010',
    projectId: 'cfspec-92512',
    storageBucket: 'cfspec-92512.appspot.com',
    iosClientId: '637584345010-bnvn2937mpfmbo0v6dbke7ll49bujuk1.apps.googleusercontent.com',
    iosBundleId: 'com.example.codeForcesSpectator',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBlsg5PYDwYXG--_6e8yb20i0V091zHEq4',
    appId: '1:637584345010:ios:cc54ae155535520fd046ab',
    messagingSenderId: '637584345010',
    projectId: 'cfspec-92512',
    storageBucket: 'cfspec-92512.appspot.com',
    iosClientId: '637584345010-lp5frau32groch92e6mle9p9oqv4597c.apps.googleusercontent.com',
    iosBundleId: 'com.example.codeForcesSpectator.RunnerTests',
  );
}
