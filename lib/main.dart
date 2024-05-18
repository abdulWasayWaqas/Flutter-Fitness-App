// ignore_for_file: camel_case_types, prefer_const_constructors
import 'package:first_app/screens/BMIcalculator.dart';
import 'package:first_app/screens/homescreen.dart';
import 'package:first_app/screens/login.dart';
import 'package:first_app/screens/register.dart';
import 'package:first_app/screens/weatherscreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  /*Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyCdJ9Y2IY0FweZBeofpl7mKs4nVvlC32NM",
          authDomain: "fitness-app-528a2.firebaseapp.com",
          projectId: "fitness-app-528a2",
          storageBucket: "fitness-app-528a2.appspot.com",
          messagingSenderId: "874866681249",
          appId: "1:874866681249:web:9ac77474920375563957e0"));*/
  runApp(const first_app());
}

class first_app extends StatelessWidget {
  const first_app({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'register': (context) => MyRegister(),
        'login': (context) => MyLogin(),
        "/": (context) => HomeScreen(),
        "//": (context) => BMIscreen(),
        "/weather": (context) => Weatherscreen()
      },
      initialRoute: "register",
    );
  }
}
