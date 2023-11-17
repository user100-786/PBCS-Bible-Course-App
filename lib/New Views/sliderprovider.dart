import 'package:flutter/material.dart';

class SliderProvider extends ChangeNotifier {
  double _value = 0;

  double get value => _value;

  set value(double value) {
    _value = value;
    notifyListeners();
  }
  void autoProgress() {
    // Implement your auto-progress logic here
    // For example, you can simulate progress by incrementing it over time
    Future.delayed(const Duration(seconds: 1), () {
      _value += 0.01;
      if (_value < 1.0) {
        autoProgress();
        _value = 0;// Call recursively for continuous progress until 100%
      }else{
        return;
      }
      notifyListeners();
    });
  }
}