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
    apiKey: 'AIzaSyB8uNDpSByRRKjOt7LpGv05PybL6nKOcME',
    appId: '1:126479003687:web:63ea790b27b17d2e309e02',
    messagingSenderId: '126479003687',
    projectId: 'breeze-forecast',
    authDomain: 'breeze-forecast.firebaseapp.com',
    storageBucket: 'breeze-forecast.appspot.com',
    measurementId: 'G-53FCX5NVEQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBATlk3rdqnIaJHtpVwlBh9VxcX_LAGkmA',
    appId: '1:126479003687:android:4bd5ae007a455925309e02',
    messagingSenderId: '126479003687',
    projectId: 'breeze-forecast',
    storageBucket: 'breeze-forecast.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCXnDDZKQYnnZZ7ZBxYc4qL39tyqcqkjvw',
    appId: '1:126479003687:ios:6904a48e1cc4a287309e02',
    messagingSenderId: '126479003687',
    projectId: 'breeze-forecast',
    storageBucket: 'breeze-forecast.appspot.com',
    iosBundleId: 'com.example.breezeForecast',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCXnDDZKQYnnZZ7ZBxYc4qL39tyqcqkjvw',
    appId: '1:126479003687:ios:59018d99a6b31991309e02',
    messagingSenderId: '126479003687',
    projectId: 'breeze-forecast',
    storageBucket: 'breeze-forecast.appspot.com',
    iosBundleId: 'com.example.breezeForecast.RunnerTests',
  );
}