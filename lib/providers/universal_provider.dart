import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/data_model.dart';

class UniversalProvider extends ChangeNotifier {
  final PageController pageController = PageController();

  DataModel? _dataModel;
  DataModel? get dataModel => _dataModel;

  int _currentScreenInd = 0;
  int get currentScreenInd => _currentScreenInd;

  set currentScreenInd(int index) {
    _currentScreenInd = index;
    notifyListeners();
  }

  void loadData() async {
    SharedPreferences preff = await SharedPreferences.getInstance();
    String? dataModelString = preff.getString('dataModel');
    _dataModel = dataModelString != null
        ? DataModel.fromJson(jsonDecode(dataModelString))
        : DataModel(0, []);
    notifyListeners();
  }
}
