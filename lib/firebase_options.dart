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
    apiKey: 'AIzaSyDw-v59Zv_EX4t0DwSr9nE_-aZ5W9WWxo0',
    appId: '1:798132945842:web:2a2e7a0ffc0de048659aab',
    messagingSenderId: '798132945842',
    projectId: 'flutter-chatify-app',
    authDomain: 'flutter-chatify-app.firebaseapp.com',
    storageBucket: 'flutter-chatify-app.appspot.com',
    measurementId: 'G-9FEY6YG31B',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCxw4OtA7HsbRGLBfdPGmtN3iRYJ2obEPQ',
    appId: '1:798132945842:android:2db9103e678e2a65659aab',
    messagingSenderId: '798132945842',
    projectId: 'flutter-chatify-app',
    storageBucket: 'flutter-chatify-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCgLswQuxA_3MqeIieTZoKg4dwz1bBlLRw',
    appId: '1:798132945842:ios:d0aa0e6b4889634e659aab',
    messagingSenderId: '798132945842',
    projectId: 'flutter-chatify-app',
    storageBucket: 'flutter-chatify-app.appspot.com',
    androidClientId: '798132945842-1oc2kk3270f4vdavh9ib9b1proo1kdk3.apps.googleusercontent.com',
    iosClientId: '798132945842-3jdb2j656copgc7c7qccce8rdpj9ooes.apps.googleusercontent.com',
    iosBundleId: 'com.example.zchatify',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCgLswQuxA_3MqeIieTZoKg4dwz1bBlLRw',
    appId: '1:798132945842:ios:d0aa0e6b4889634e659aab',
    messagingSenderId: '798132945842',
    projectId: 'flutter-chatify-app',
    storageBucket: 'flutter-chatify-app.appspot.com',
    androidClientId: '798132945842-1oc2kk3270f4vdavh9ib9b1proo1kdk3.apps.googleusercontent.com',
    iosClientId: '798132945842-3jdb2j656copgc7c7qccce8rdpj9ooes.apps.googleusercontent.com',
    iosBundleId: 'com.example.zchatify',
  );
}
