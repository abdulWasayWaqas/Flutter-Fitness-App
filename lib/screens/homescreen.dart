// ignore_for_file: prefer_const_constructors

import 'package:first_app/common/bottombar.dart';
import 'package:first_app/common/menudrawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Fitness App"),
          backgroundColor: Color.fromARGB(103, 192, 64, 156),
        ),
        drawer: const MenuDrawer(),
        bottomNavigationBar: MyBottomNavBar(),
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/home.png"))),
            child: Center(
                child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color.fromARGB(103, 192, 64, 156)),
                    child: Text(
                      "Stay Fit and have a Healthy Life",
                      style: TextStyle(fontSize: 15),
                    )))));
  }
}
