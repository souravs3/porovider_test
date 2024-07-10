import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int _a = 0;

  int get a => _a;

  void counter() {
    _a++;
    notifyListeners();
  }
}
