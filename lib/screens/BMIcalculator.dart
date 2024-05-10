// ignore_for_file: prefer_const_constructors, non_constant_identifier_names
import 'dart:math';
import 'package:first_app/common/bottombar.dart';
import 'package:first_app/common/menudrawer.dart';
import 'package:flutter/material.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

class BMIscreen extends StatefulWidget {
  const BMIscreen({super.key});

  @override
  State<BMIscreen> createState() => _BMIcsreenState();
}

class _BMIcsreenState extends State<BMIscreen> {
  int _selectedGender = 0, _height = 170, _age = 20, _weight = 60;
  double _bmi = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("BMI Calculator"),
      ),
      drawer: const MenuDrawer(),
      bottomNavigationBar: MyBottomNavBar(),
      body: _BMIcalculatorUI(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _bmi = _weight / pow(_height / 100, 2);
          });
        },
        child: const Icon(
          Icons.calculate,
        ),
      ),
    );
  }

  Widget _BMIcalculatorUI() {
    return Column(
      children: [
        _genderSelector(),
        _heightInput(),
        _weightAndAgeInputRow(),
        _bmiResult(),
        _bmiCategory(),
      ],
    );
  }

  Widget _bmiCategory() {
    String category = "";
    if (_bmi < 18.5) {
      category = "Underweight";
    } else if (_bmi >= 18.5 && _bmi < 24.9) {
      category = "Normal Weight";
    } else if (_bmi >= 25.0 && _bmi < 29.9) {
      category = "Overweight";
    } else {
      category = "Obese";
    }

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: Text(
        "Category: $category",
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _genderSelector() {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(
          15,
        ),
      ),
      margin: const EdgeInsets.all(
        10.0,
      ),
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              IconButton(
                iconSize: 60,
                onPressed: () {
                  setState(() {
                    _selectedGender = 0;
                  });
                },
                icon: Icon(
                  Icons.male,
                  color: _selectedGender == 0
                      ? Color.fromARGB(103, 192, 64, 156)
                      : Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              const Text(
                "Male",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ],
          ),
          Column(
            children: [
              IconButton(
                iconSize: 60,
                onPressed: () {
                  setState(() {
                    _selectedGender = 1;
                  });
                },
                icon: Icon(
                  Icons.female,
                  color: _selectedGender == 1
                      ? Color.fromARGB(103, 192, 64, 156)
                      : Colors.white38,
                ),
              ),
              const Text(
                "Female",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _heightInput() {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(
          15,
        ),
      ),
      margin: const EdgeInsets.all(
        10.0,
      ),
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      child: Column(
        children: [
          const Text(
            "Height",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          Slider(
            min: 0,
            max: 300,
            divisions: 300,
            value: _height.toDouble(),
            onChanged: (value) {
              setState(
                () {
                  _height = value.toInt();
                },
              );
            },
            activeColor: Color.fromARGB(
                103, 192, 64, 156), // Change slider active color to black
            inactiveColor:
                Colors.white38, // Change slider inactive color to grey
          ),
          Text(
            "$_height cm",
            style: const TextStyle(
              fontSize: 20,
            ),
          )
        ],
      ),
    );
  }

  Widget _weightAndAgeInputRow() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _weightInput(),
        _ageInput(),
      ],
    );
  }

  Widget _weightInput() {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(
          15,
        ),
      ),
      margin: const EdgeInsets.all(
        10.0,
      ),
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 10.0,
      ),
      child: Column(
        children: [
          const Text(
            "Weight",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          ItemCount(
            buttonSizeHeight: 30,
            buttonSizeWidth: 53,
            initialValue: _weight,
            minValue: 20,
            maxValue: 250,
            onChanged: (value) {
              setState(() {
                _weight = value.toInt();
              });
            },
            decimalPlaces: 0,
            color: Color.fromARGB(103, 192, 64, 156),
          ),
        ],
      ),
    );
  }

  Widget _ageInput() {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(
          15,
        ),
      ),
      margin: const EdgeInsets.all(
        10.0,
      ),
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 10.0,
      ),
      child: Column(
        children: [
          const Text(
            "Age",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          ItemCount(
            buttonSizeHeight: 30,
            buttonSizeWidth: 53,
            initialValue: _age,
            minValue: 1,
            maxValue: 100,
            onChanged: (value) {
              setState(() {
                _age = value.toInt();
              });
            },
            decimalPlaces: 0,
            color: Color.fromARGB(103, 192, 64, 156),
          ),
        ],
      ),
    );
  }

  Widget _bmiResult() {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(
          15,
        ),
      ),
      margin: const EdgeInsets.all(
        10.0,
      ),
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 10.0,
      ),
      child: Text(
        "BMI: ${_bmi.toStringAsFixed(1)}",
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
