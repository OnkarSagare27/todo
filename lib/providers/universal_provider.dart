import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

  void showAddTaskDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: SingleChildScrollView(
            child: AlertDialog(
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.white,
              title: Text(
                'Add Task',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                  fontSize: 15.sp,
                ),
              ),
              content: Column(
                children: [
                  const TextField(
                    maxLines: 1,
                    autocorrect: false,
                    decoration: InputDecoration(
                      hintText: 'Title',
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  const TextField(
                    maxLines: 2,
                    decoration: InputDecoration(
                      hintText: 'Descrption',
                    ),
                  ),
                ],
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Add'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
