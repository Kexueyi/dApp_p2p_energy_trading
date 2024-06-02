import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAOfpS7lat-kKidMdPQeWdJ7xwgGwAi0ro",
            authDomain: "energytradingauction.firebaseapp.com",
            projectId: "energytradingauction",
            storageBucket: "energytradingauction.appspot.com",
            messagingSenderId: "309378507599",
            appId: "1:309378507599:web:1bd4f8dcb3bb6589815b3a",
            measurementId: "G-7LZSZ2EY2Z"));
  } else {
    await Firebase.initializeApp();
  }
}
