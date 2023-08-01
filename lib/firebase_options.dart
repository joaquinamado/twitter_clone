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
    apiKey: 'AIzaSyCD_5pF6kx8HyP55solNz9xj6jDguA0RAE',
    appId: '1:387651705847:web:d1ddc8a7bdd65f9562ecf2',
    messagingSenderId: '387651705847',
    projectId: 'twitter-dev-57bd4',
    authDomain: 'twitter-dev-57bd4.firebaseapp.com',
    storageBucket: 'twitter-dev-57bd4.appspot.com',
    measurementId: 'G-YXTK8VBC93',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDpAbNp99YqqocJP__GVIS1Dqj8qdqMCw4',
    appId: '1:387651705847:android:4ffe2e62504e256f62ecf2',
    messagingSenderId: '387651705847',
    projectId: 'twitter-dev-57bd4',
    storageBucket: 'twitter-dev-57bd4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCNI6rDir8e6IMoXsAW-1FV6Jr8ePoVGpg',
    appId: '1:387651705847:ios:69526518479fe3b662ecf2',
    messagingSenderId: '387651705847',
    projectId: 'twitter-dev-57bd4',
    storageBucket: 'twitter-dev-57bd4.appspot.com',
    androidClientId: '387651705847-lgkb739gdhusid3seche5kr2a40gkgge.apps.googleusercontent.com',
    iosClientId: '387651705847-c5fab9hq0g3kk6igno7qjfj7h7ghlhpe.apps.googleusercontent.com',
    iosBundleId: 'com.example.twitterClone',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCNI6rDir8e6IMoXsAW-1FV6Jr8ePoVGpg',
    appId: '1:387651705847:ios:c60f7486bcfb51b762ecf2',
    messagingSenderId: '387651705847',
    projectId: 'twitter-dev-57bd4',
    storageBucket: 'twitter-dev-57bd4.appspot.com',
    androidClientId: '387651705847-lgkb739gdhusid3seche5kr2a40gkgge.apps.googleusercontent.com',
    iosClientId: '387651705847-bljvspn6u5jqsel9d7hdp9vkqcblpgt8.apps.googleusercontent.com',
    iosBundleId: 'com.example.twitterClone.RunnerTests',
  );
}