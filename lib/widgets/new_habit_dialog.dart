import 'package:flutter/material.dart';

class NewHabitDialog extends StatelessWidget {
  const NewHabitDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    return AlertDialog(
      actions: [
        MaterialButton(
          onPressed: () {},
          color: Colors.black,
          child: const Text(
            'Save',
            style: TextStyle(color: Colors.white),
          ),
        ),
        MaterialButton(
          onPressed: () {
            cancel(context);
          },
          color: Colors.black,
          child: const Text(
            'Cancel',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
      content: TextField(
        decoration: const InputDecoration(hintText: 'Enter name of the task'),
        controller: nameController,
      ),
    );
  }

  void cancel(BuildContext context) {
    Navigator.of(context).pop();
  }
}
