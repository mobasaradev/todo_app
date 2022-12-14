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
    apiKey: 'AIzaSyChw1_Z6KClRH1ajRmoCSiBUSfxM2q0m1o',
    appId: '1:341571938902:web:34d3c80443b3d09a8fe9f7',
    messagingSenderId: '341571938902',
    projectId: 'todo-8f432',
    authDomain: 'todo-8f432.firebaseapp.com',
    storageBucket: 'todo-8f432.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCI21WZEYQQQs-gtgLqi4v3thCbDrhxsWk',
    appId: '1:341571938902:android:507d759ac8e334e28fe9f7',
    messagingSenderId: '341571938902',
    projectId: 'todo-8f432',
    storageBucket: 'todo-8f432.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB6KXhfDDimSgrKudEvbMl7lxuyrR67FCc',
    appId: '1:341571938902:ios:e306f42d49fa6de58fe9f7',
    messagingSenderId: '341571938902',
    projectId: 'todo-8f432',
    storageBucket: 'todo-8f432.appspot.com',
    iosClientId: '341571938902-squjif78fed6vr5fk8jp5or1js51qade.apps.googleusercontent.com',
    iosBundleId: 'com.example.todoApp',
  );
}
