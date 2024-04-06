import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDhAUwzMgH3JDwVf6V6TxEp77hQh1WuCcM",
            authDomain: "login-25hn6a.firebaseapp.com",
            projectId: "login-25hn6a",
            storageBucket: "login-25hn6a.appspot.com",
            messagingSenderId: "891748048568",
            appId: "1:891748048568:web:140eacdf01a4c3d0585e4d"));
  } else {
    await Firebase.initializeApp();
  }
}
