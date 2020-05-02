import 'package:flutter/cupertino.dart';
import 'dart:math';

class BmiBrain {
  final double height;
  final int weight;

  BmiBrain({@required this.height, @required this.weight});

  double _bmi;

  void calculateBmi() => _bmi = weight / pow(height / 100, 2);

  String getBmi() => _bmi.toStringAsFixed(1);

  String getFeedbackKeys() {
    _bmi = double.parse(_bmi.toStringAsFixed(1));
    String feedbackKey;
    if (_bmi < 18.5) {
      feedbackKey = 'UNDERWEIGHT';
    } else if (18.5 <= _bmi && _bmi <= 25.0) {
      feedbackKey = 'NORMAL';
    } else if (25.0 < _bmi && _bmi <= 30.0) {
      feedbackKey = 'OVERWEIGHT';
    } else if (30.0 < _bmi && _bmi <= 40) {
      feedbackKey = 'OBESITY';
    } else if (40 < _bmi) {
      feedbackKey = 'OBESITY';
    }
    return feedbackKey;
  }

  String getFeedback() {
    String feedback;
    if (_bmi < 18.5) {
      feedback = 'You are UNDERWEIGHT. You can eat more.';
    } else if (18.5 <= _bmi && _bmi <= 25.0) {
      feedback = 'You have a NORMAL body weight. Good job!';
    } else if (25.0 < _bmi && _bmi <= 30.0) {
      feedback = 'You are OVERWEIGHT, Try to find sport that you like';
    } else if (30 < _bmi) {
      feedback = 'You are OBESE, Better to learn more about healthy life.';
    }
    return feedback;
  }
}
