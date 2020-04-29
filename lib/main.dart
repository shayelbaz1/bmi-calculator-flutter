import 'package:flutter/material.dart';
import 'input_page.dart';

//Shay
void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF241A3C),
      ),
      home: InputPage(),
    );
  }
}
