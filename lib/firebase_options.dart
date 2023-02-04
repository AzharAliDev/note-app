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
    apiKey: 'AIzaSyCzQuMIS_ELqxyDbBQ9fpuLF8TjBoggzTA',
    appId: '1:167183573540:web:9bae9daf3223f6ce5eaeb1',
    messagingSenderId: '167183573540',
    projectId: 'note-app-ef69a',
    authDomain: 'note-app-ef69a.firebaseapp.com',
    storageBucket: 'note-app-ef69a.appspot.com',
    measurementId: 'G-YTH9YCHKSM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyApL87auQeWnZpC9owXyPOglpS0DnmQCoo',
    appId: '1:167183573540:android:0f0380d8c6d61ed65eaeb1',
    messagingSenderId: '167183573540',
    projectId: 'note-app-ef69a',
    storageBucket: 'note-app-ef69a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBJwtl3dlJxfj8PTqC0pyobyfnffwf79ho',
    appId: '1:167183573540:ios:35caee734d71a2b15eaeb1',
    messagingSenderId: '167183573540',
    projectId: 'note-app-ef69a',
    storageBucket: 'note-app-ef69a.appspot.com',
    iosClientId: '167183573540-14q8t5o2g0tpo68uh1tb2411sobp1vda.apps.googleusercontent.com',
    iosBundleId: 'com.application.dev.flutter.noteapp.noteapp',
  );
}