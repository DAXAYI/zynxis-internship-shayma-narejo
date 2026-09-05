import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  int _counter = 0;
  bool _isDarkMode = true;

  int get counter => _counter;
  bool get isDarkMode => _isDarkMode;

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }

  void decrementCounter() {
    if (_counter > 0) {
      _counter--;
      notifyListeners();
    }
  }

  void resetCounter() {
    _counter = 0;
    notifyListeners();
  }

  void toggleTheme(bool value) {
    _isDarkMode = value;
    notifyListeners();
  }
}