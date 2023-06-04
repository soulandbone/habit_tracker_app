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
    return Row(
      children: [
        Checkbox(value: habitCompleted, onChanged: onChangedValue),
        Text(title)
      ],
    );
  }
}
