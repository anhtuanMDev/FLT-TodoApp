// ignore_for_file: file_names

import 'package:hive_flutter/adapters.dart';

class TodoData {
  List todo = [];
  final box = Hive.box("todo");

  void createInitial() {
    todo = [
      ["This is the to item", false],
      ["Press the task to mark as done", false],
      ["This is when you done the task", true],
      ["Swipe right to delete", false],
      ["Swipe left to edit", false],
      ["Press plus button to add, insert your task", false],
    ];
  }

  void saveData() {
    box.put("TODOLIST", todo);
  }

  void loadData() {
    todo = box.get("TODOLIST", defaultValue: () => createInitial());
  }
}
