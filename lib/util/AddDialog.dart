// ignore_for_file: file_names

import 'package:flutter/material.dart';

class AddDialog extends StatelessWidget {
  final VoidCallback addTask;
  final TextEditingController controller;
  const AddDialog({super.key, required this.addTask, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Task',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      backgroundColor: Colors.blue[300],
      content: TextField(
        controller: controller,
        decoration: const InputDecoration(
          hintText: 'Enter Task Name',
        ),
        style: const TextStyle(color: Colors.white),
      ),
      actions: [
        TextButton(
            onPressed: () {
              controller.clear();
              Navigator.of(context).pop();
            },
            child: Text('Cancel',
                style: TextStyle(
                  color: Colors.blue[900],
                ))),
        TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue[900]),
            ),
            onPressed: () {
              addTask();
              Navigator.of(context).pop();
            },
            child: const Text(
              'Add',
              style: TextStyle(color: Colors.white),
            ))
      ],
    );
  }
}
