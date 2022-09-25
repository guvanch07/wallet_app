import 'package:flutter/material.dart';

class CalculateBloc extends ChangeNotifier {
  List<int> get displayNumbers => _displayNumbers;
  int get subNumber => _subNumber;

  int get sum => _sum;

  final List<int> _displayNumbers = [];
  int _subNumber = 0;
  int _sum = 0;

  void addNumbers(int number) {
    _displayNumbers.add(number);
    _subNumber = number + number;
    notifyListeners();
  }

  void removeNumbers() {
    _displayNumbers.removeLast();
    _subNumber = 0;
    notifyListeners();
  }

  void submitButton(bool isSubmit) {
    if (isSubmit) {
      if (_displayNumbers.isEmpty) return;
      _sum = _displayNumbers.reduce(
          (value, element) => (value + element) * _displayNumbers.length);
    } else {
      _displayNumbers.clear();
      _subNumber = 0;
    }

    notifyListeners();
  }
}
