import 'package:flutter/material.dart';

class UniversalProvider extends ChangeNotifier {
  final PageController pageController = PageController();

  int _currentScreenInd = 0;
  int get currentScreenInd => _currentScreenInd;

  set currentScreenInd(int index) {
    _currentScreenInd = index;
    notifyListeners();
  }
}
