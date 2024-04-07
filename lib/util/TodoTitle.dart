// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTitle extends StatelessWidget {
  final String name;
  final bool isDone;
  final Function(bool?) toggleCheckbox;
  final Function(BuildContext) deleteTask;
  final Function(BuildContext) editTask;
  const TodoTitle(
      {super.key,
      required this.name,
      required this.isDone,
      required this.deleteTask,
      required this.editTask,
      required this.toggleCheckbox});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 5, left: 15, right: 15),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteTask,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
          ],
        ),
        startActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: editTask,
              icon: Icons.edit,
              backgroundColor: Colors.white,
              foregroundColor: Colors.blue,
            ),
          ],
        ),
        child: Container(
          padding:
              const EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 10),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                  child: Text(
                name.toUpperCase(),
                softWrap: true,
                style: TextStyle(
                    decoration: isDone
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    color: isDone
                        ? Colors.black38
                        : Theme.of(context).colorScheme.onPrimary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )),
              Checkbox(
                value: isDone,
                onChanged: toggleCheckbox,
                activeColor: Colors.blue[900],
              )
            ],
          ),
        ),
      ),
    );
  }
}
