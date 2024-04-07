// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:simple_app/util/AddDialog.dart';
import 'package:simple_app/util/EditDialog.dart';
import 'package:simple_app/util/TodoTitle.dart';

class Time extends StatefulWidget {
  final List todo;
  const Time({super.key, this.todo = const []});

  @override
  State<Time> createState() => _TimeState();
}

class _TimeState extends State<Time> with AutomaticKeepAliveClientMixin {
  /// Decalre initialize value for todo List
  List todo = [];

  @override
  void initState() {
    super.initState();
    todo = List.from(widget.todo);
  }

  /// Change value of isDone
  void onChange(bool? v, int? index) {
    setState(() {
      todo[index!][1] = v!;
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
                todo.add([controller.text, false]);
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
      todo.removeAt(index);
    });
  }

  void updateTask(int index) {
    showDialog(
        context: context,
        builder: (context) {
          return EditDialog(
            addTask: () => {
              setState(() {
                todo[index][0] = controller.text;
              }),
              controller.clear()
            },
            controller: controller,
          );
        });
  }

  final controller = TextEditingController();

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Stack(
          children: <Widget>[
            ListView.builder(
              itemCount: todo.length,
              itemBuilder: (context, index) {
                return TodoTitle(
                  name: todo[index][0],
                  isDone: todo[index][1],
                  toggleCheckbox: (v) => onChange(v, index),
                  editTask: (context) => updateTask(index),
                  deleteTask: (context) => deleteTask(index),
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
