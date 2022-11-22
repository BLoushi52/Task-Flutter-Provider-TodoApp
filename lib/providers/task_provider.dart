import 'package:flutter/material.dart';

class TaskProvider extends ChangeNotifier {
  List<String> tasks = [
    "define provider class",
    "Provide /Configure the provider",
    "watch/read provider variables/function",
  ];

  void addTask(String task) {
    tasks.add(task);
    notifyListeners();
  }
}
