import 'package:flutter/material.dart';

class NewHabitDialog extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSaved;
  final VoidCallback onCancel;
  NewHabitDialog(
      {required this.controller,
      required this.onSaved,
      required this.onCancel,
      super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        actions: [
          MaterialButton(
            onPressed: onSaved,
            color: Colors.black,
            child: const Text(
              'Save',
              style: TextStyle(color: Colors.white),
            ),
          ),
          MaterialButton(
            onPressed: onCancel,
            color: Colors.black,
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
        content: TextField(
          decoration: const InputDecoration(
            hintText: 'Enter name of the task',
            border: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.black)),
          ),
          controller: controller,
        ));
  }
}
