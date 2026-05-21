import 'package:flutter/material.dart';

class BottomNavbarProvider extends ChangeNotifier {
  // propriétés
  int _screenIndex = 0;

  // getter / setter
  int get screenIndex => _screenIndex;
  set screenIndex(int value) {
    _screenIndex = value;
    notifyListeners();
  }
}
