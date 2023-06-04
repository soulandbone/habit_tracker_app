import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  //final int index;
  final String title;
  final bool habitCompleted;
  final Function(bool?) onChangedValue;

  TaskTile(
      {required this.title,
      required this.habitCompleted,
      required this.onChangedValue});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Colors.grey[100], borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            Checkbox(value: habitCompleted, onChanged: onChangedValue),
            Text(title)
          ],
        ),
      ),
    );
  }
}
