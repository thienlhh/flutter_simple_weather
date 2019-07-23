import 'package:flutter/material.dart';

import 'package:simple_weather/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Weather',
      theme: ThemeData(primaryColor: Colors.white),
      home: Home(title: 'Bucharest, RO'),
    );
  }
}
