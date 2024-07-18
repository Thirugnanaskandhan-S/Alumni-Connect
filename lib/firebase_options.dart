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
    apiKey: 'AIzaSyDOb5uKZKgNGAf5vftprwUv3pOM_LFDELQ',
    appId: '1:19347336687:web:0c4757e486d362e0e75a1a',
    messagingSenderId: '19347336687',
    projectId: 'aluminiconnect-d99ca',
    authDomain: 'aluminiconnect-d99ca.firebaseapp.com',
    storageBucket: 'aluminiconnect-d99ca.appspot.com',
    measurementId: 'G-465N94Y0B2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDRGuruJoJ0ITncmx8qyoJWISsJl2v4_4Q',
    appId: '1:19347336687:android:5b771c1b46283b8ae75a1a',
    messagingSenderId: '19347336687',
    projectId: 'aluminiconnect-d99ca',
    storageBucket: 'aluminiconnect-d99ca.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA4WFE4SAbEaVLLd3TpPAKaqin_kTdyvPU',
    appId: '1:19347336687:ios:9d5bbf051b8813dae75a1a',
    messagingSenderId: '19347336687',
    projectId: 'aluminiconnect-d99ca',
    storageBucket: 'aluminiconnect-d99ca.appspot.com',
    iosClientId: '19347336687-g7l7cr4gs6ilceg9frdfbgqup8feap7r.apps.googleusercontent.com',
    iosBundleId: 'com.example.aluminiFinal',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA4WFE4SAbEaVLLd3TpPAKaqin_kTdyvPU',
    appId: '1:19347336687:ios:9d5bbf051b8813dae75a1a',
    messagingSenderId: '19347336687',
    projectId: 'aluminiconnect-d99ca',
    storageBucket: 'aluminiconnect-d99ca.appspot.com',
    iosClientId: '19347336687-g7l7cr4gs6ilceg9frdfbgqup8feap7r.apps.googleusercontent.com',
    iosBundleId: 'com.example.aluminiFinal',
  );
}
