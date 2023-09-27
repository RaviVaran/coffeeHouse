import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCh86mgBag3BNjdxPuODhet7FVhVXI-Bq4",
            authDomain: "coffeeshop-app-76243.firebaseapp.com",
            projectId: "coffeeshop-app-76243",
            storageBucket: "coffeeshop-app-76243.appspot.com",
            messagingSenderId: "429791905524",
            appId: "1:429791905524:web:2217f6794699053b6540a1",
            measurementId: "G-7N53DNS6ZX"));
  } else {
    await Firebase.initializeApp();
  }
}
