// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:simple_app/data/TodoData.dart';
import 'package:simple_app/util/AddDialog.dart';
import 'package:simple_app/util/EditDialog.dart';
import 'package:simple_app/util/TodoTitle.dart';

class Permant extends StatefulWidget {
  const Permant({super.key});

  @override
  State<Permant> createState() => _PermantState();
}

class _PermantState extends State<Permant> {
  /// Decalre initialize value for todo List
  final box = Hive.box("todo");
  TodoData db = TodoData();

  @override
  void initState() {
    if (box.get("TODOLIST") == null) {
      db.createInitial();
    } else {
      db.loadData();
    }
    super.initState();
  }

  /// Change value of isDone
  void onChange(bool? v, int? index) {
    setState(() {
      db.todo[index!][1] = v!;
      db.saveData();
    });
  }

  /// Create New Task
  void addTask() {
    showDialog(
        context: context,
        builder: (context) {
          return AddDialog(
            addTask: () => {
              setState(() {
                db.todo.add([controller.text, false]);
                db.saveData();
              }),
              controller.clear()
            },
            controller: controller,
          );
        });
  }

  /// Delete Task
  void deleteTask(int index) {
    setState(() {
      db.todo.removeAt(index);
      db.saveData();
    });
  }

  /// Update Task
  void updateTask(int index) {
    showDialog(
        context: context,
        builder: (context) {
          return EditDialog(
            addTask: () => {
              setState(() {
                db.todo[index][0] = controller.text;
                db.saveData();
              }),
              controller.clear()
            },
            controller: controller,
          );
        });
  }

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Stack(
          children: <Widget>[
            ListView.builder(
              itemCount: db.todo.length,
              itemBuilder: (context, index) {
                return TodoTitle(
                  name: db.todo[index][0],
                  isDone: db.todo[index][1],
                  toggleCheckbox: (v) => onChange(v, index),
                  deleteTask: (context) => deleteTask(index),
                  editTask: (context) => updateTask(index),
                );
              },
            ),
            Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Center(
                    child: FloatingActionButton(
                  onPressed: () => addTask(),
                  backgroundColor: Colors.blue[900],
                  child: const Icon(Icons.add),
                )))
          ],
        ));
  }
}
