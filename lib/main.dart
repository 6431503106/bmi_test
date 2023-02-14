import 'package:flutter/material.dart';
import 'package:bmr_test/screen/calculator_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color.fromARGB(255, 4, 5, 10),
      ),
      home: CalculatorScreen(),
    );
  }
}
