// ignore_for_file: camel_case_types, prefer_const_constructors
import 'package:first_app/screens/BMIcalculator.dart';
import 'package:first_app/screens/homescreen.dart';
import 'package:first_app/screens/login.dart';
import 'package:first_app/screens/register.dart';
import 'package:first_app/screens/weatherscreen.dart';
import 'package:flutter/material.dart';

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
