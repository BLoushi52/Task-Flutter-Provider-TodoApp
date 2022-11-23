import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';

class TaskProvider extends ChangeNotifier {
  List<Todo> tasks = [
    Todo(text: "define provider class", isComplete: false),
    Todo(text: "Provide /Configure the provider", isComplete: false),
    Todo(text: "watch/read provider variables/function", isComplete: true),
  ];

  void addTask(String task) {
    tasks.add(Todo(
      text: task,
      isComplete: false,
    ));
    notifyListeners();
  }

  void changeTaskStatusByIndex(int index) {
    tasks[index].isComplete = !tasks[index].isComplete;
    notifyListeners();
  }

  void removeTask(int index) {
    tasks.removeAt(index);
    notifyListeners();
  }

  void removeAll() {
    tasks.clear();
    notifyListeners();
  }
}
