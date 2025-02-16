import 'package:flutter/material.dart';

class ContainerOneProvider extends ChangeNotifier {
  double _value = 1.0;
  double get value => _value;

  void set(double val) {
    _value = val;
    notifyListeners();
  }
}
