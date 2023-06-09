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
    apiKey: 'AIzaSyB_WTDmH4gKyJ2o9OrCVVQmlGEsCx1Zibg',
    appId: '1:359131100290:web:7d12cb17ea1f49e36a309b',
    messagingSenderId: '359131100290',
    projectId: 'internship-6f3c6',
    authDomain: 'internship-6f3c6.firebaseapp.com',
    storageBucket: 'internship-6f3c6.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCHEZuBNlmFChpdJCLM-9N-bHHZ0U8G2Ng',
    appId: '1:359131100290:android:e76df1fe7572c3176a309b',
    messagingSenderId: '359131100290',
    projectId: 'internship-6f3c6',
    storageBucket: 'internship-6f3c6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBzRLXRhhWerLQ4eYLOUDnvtAXDNCOeQwo',
    appId: '1:359131100290:ios:f7f55457c88726c96a309b',
    messagingSenderId: '359131100290',
    projectId: 'internship-6f3c6',
    storageBucket: 'internship-6f3c6.appspot.com',
    iosClientId: '359131100290-felsj19tumi1uadlrcakav85tuc66d08.apps.googleusercontent.com',
    iosBundleId: 'com.example.internship',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBzRLXRhhWerLQ4eYLOUDnvtAXDNCOeQwo',
    appId: '1:359131100290:ios:f7f55457c88726c96a309b',
    messagingSenderId: '359131100290',
    projectId: 'internship-6f3c6',
    storageBucket: 'internship-6f3c6.appspot.com',
    iosClientId: '359131100290-felsj19tumi1uadlrcakav85tuc66d08.apps.googleusercontent.com',
    iosBundleId: 'com.example.internship',
  );
}
