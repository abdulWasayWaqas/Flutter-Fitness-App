// ignore_for_file: prefer_const_constructors

import 'package:first_app/common/menudrawer.dart';
import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:async';

class StepCounterScreen extends StatefulWidget {
  @override
  _StepCounterScreenState createState() => _StepCounterScreenState();
}

class _StepCounterScreenState extends State<StepCounterScreen> {
  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  String _status = '?', _steps = '?', _distance = '?', _calories = '?';
  int _initialStepCount = 0;
  bool _initialStepCountSet = false;
  final double _strideLength = 0.78; // Average stride length in meters
  final double _weight = 70; // Average weight in kilograms
  bool _isCounting = false;

  @override
  void initState() {
    super.initState();
    requestPermissions();
  }

  Future<void> requestPermissions() async {
    // Request permissions for activity recognition
    PermissionStatus status = await Permission.activityRecognition.request();
    if (status.isGranted) {
      initPlatformState();
    } else {
      print("Permission Denied");
    }
  }

  void startCounting() {
    setState(() {
      _isCounting = true;
    });
  }

  void resetCount() {
    setState(() {
      _isCounting = false;
      _initialStepCountSet = false;
      _initialStepCount = 0;
      _steps = '0';
      _distance = '0';
      _calories = '0';
      _status = 'none';
    });
  }

  void onStepCount(StepCount event) {
    print(event);
    setState(() {
      if (!_initialStepCountSet) {
        _initialStepCount = event.steps;
        _initialStepCountSet = true;
      }
      int currentSteps = event.steps - _initialStepCount;
      _steps = currentSteps.toString();
      _distance = (currentSteps * _strideLength / 1000)
          .toStringAsFixed(2); // Distance in kilometers
      _calories = (currentSteps * _weight * 0.0005)
          .toStringAsFixed(2); // Calories burnt
    });
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    print(event);
    setState(() {
      _status = event.status;
    });
  }

  void onPedestrianStatusError(error) {
    print('onPedestrianStatusError: $error');
    setState(() {
      _status = 'Pedestrian Status not available';
    });
    print(_status);
  }

  void onStepCountError(error) {
    print('onStepCountError: $error');
    setState(() {
      _steps = 'Step Count not available';
      _distance = 'Distance not available';
      _calories = 'Calories not available';
    });
  }

  void initPlatformState() {
    _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    _pedestrianStatusStream
        .listen(onPedestrianStatusChanged)
        .onError(onPedestrianStatusError);

    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);

    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.orange, scaffoldBackgroundColor: Colors.black),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Step Counter'),
          backgroundColor: Colors.orange,
        ),
        drawer: MenuDrawer(),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.orange, // Button background color
                        foregroundColor: Colors.black, // Text color
                      ),
                      onPressed: !_isCounting ? startCounting : null,
                      child: Text('Start'),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.orange, // Button background color
                        foregroundColor: Colors.black, // Text color
                      ),
                      onPressed: _isCounting ? resetCount : null,
                      child: Text('Reset'),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Steps Taken: ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange[900],
                      ),
                    ),
                    Text(
                      _steps,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Distance Covered (km): ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange[900],
                      ),
                    ),
                    Text(
                      _distance,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  'Calories Burnt: $_calories',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange[900],
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Pedestrian Status: $_status',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange[900],
                  ),
                ),
                Icon(
                  _status == 'walking'
                      ? Icons.directions_walk
                      : _status == 'stopped'
                          ? Icons.accessibility_new
                          : Icons.error,
                  size: 100,
                  color: Colors.orange,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
