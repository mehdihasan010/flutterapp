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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBcbgRM5rClITUdOt3QAMb0vHQp0wmTO_4',
    appId: '1:122424366395:android:ee423771b0114320d5931e',
    messagingSenderId: '122424366395',
    projectId: 'bloc-ecommerce-mh',
    storageBucket: 'bloc-ecommerce-mh.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCeJXRhrLNibBSRwJFzrDM3xk6kx8pMp60',
    appId: '1:122424366395:ios:d0d453e049cf685cd5931e',
    messagingSenderId: '122424366395',
    projectId: 'bloc-ecommerce-mh',
    storageBucket: 'bloc-ecommerce-mh.appspot.com',
    androidClientId: '122424366395-u1aatc13aa7qfig39hfalbs2agulu379.apps.googleusercontent.com',
    iosClientId: '122424366395-80t18qkrflb46aojqm5umf14kg5f163b.apps.googleusercontent.com',
    iosBundleId: 'com.codejet.blocecommerce.blocEcommerce',
  );
}
