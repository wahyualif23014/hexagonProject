import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import '../screen/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIzaSyD3ANmiWbk2E5G_CgNhbR0Lv482-5wNVbI',
      appId: '1:834535690693:android:9449eef4ef6b0e2f84bbac',
      messagingSenderId: '834535690693',
      projectId: 'hexagon-63917"',
      databaseURL: 'https://hexagon-63917-default-rtdb.firebaseio.com',
      storageBucket: 'hexagon-63917.firebasestorage.app',
    ),
  );
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}