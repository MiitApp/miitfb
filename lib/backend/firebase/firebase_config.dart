import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDs8rG0UxYHIi-4n8snoClbgMFW5b5QbrU",
            authDomain: "miit-firebase.firebaseapp.com",
            projectId: "miit-firebase",
            storageBucket: "miit-firebase.appspot.com",
            messagingSenderId: "1095828821911",
            appId: "1:1095828821911:web:2f2123a2e115c07ab596d2",
            measurementId: "G-D5QP3V4N2V"));
  } else {
    await Firebase.initializeApp();
  }
}
