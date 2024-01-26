import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/models/task_model.dart';
import '../models/data_model.dart';
import '../widgets/add_task_dialog_box.dart';

class UniversalProvider extends ChangeNotifier {
  final PageController pageController = PageController();
  Color selectedColor = Colors.pink;

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

  void addTask(TaskModel taskModel) async {
    SharedPreferences preff = await SharedPreferences.getInstance();
    _dataModel!.tasks.add(taskModel);
    await preff.setString('dataModel', jsonEncode(_dataModel!.toJson()));
    notifyListeners();
  }

  void showAddTaskDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AddTaskDialog(
          onAddPressed: (color, title, description) => addTask(
            TaskModel(
              id: _dataModel!.lastInd + 1,
              status: 'Incomplete',
              name: title,
              description: description,
              argb: [color.alpha, color.red, color.green, color.blue],
            ),
          ),
        );
      },
    );
  }
}
