// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA8b3oWsAZ7dN8UScltmWd-ApSZDhEUDks',
    appId: '1:94618526224:android:fb8972bb8131cc841b6095',
    messagingSenderId: '94618526224',
    projectId: 'padhaikaro-d11f2',
    storageBucket: 'padhaikaro-d11f2.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCRUVkqaMs6nVWaBaam4E_CSXZEe360g0E',
    appId: '1:94618526224:ios:acc98755d429fe681b6095',
    messagingSenderId: '94618526224',
    projectId: 'padhaikaro-d11f2',
    storageBucket: 'padhaikaro-d11f2.firebasestorage.app',
    iosBundleId: 'com.example.studyHub',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCRUVkqaMs6nVWaBaam4E_CSXZEe360g0E',
    appId: '1:94618526224:ios:acc98755d429fe681b6095',
    messagingSenderId: '94618526224',
    projectId: 'padhaikaro-d11f2',
    storageBucket: 'padhaikaro-d11f2.firebasestorage.app',
    iosBundleId: 'com.example.studyHub',
  );
}
