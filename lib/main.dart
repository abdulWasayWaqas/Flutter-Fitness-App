// ignore_for_file: camel_case_types, prefer_const_constructors
import 'package:first_app/screens/BMIcalculator.dart';
import 'package:first_app/screens/weatherscreen.dart';
import 'package:flutter/material.dart';
import 'package:first_app/screens/homeScreen.dart';

void main() {
  runApp(const first_app());
}

class first_app extends StatelessWidget {
  const first_app({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => HomeScreen(),
        "//": (context) => BMIscreen(),
        "/weather": (context) => Weatherscreen()
      },
      initialRoute: "/",
    );
  }
}
