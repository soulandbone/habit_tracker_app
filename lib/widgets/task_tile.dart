import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  const TaskTile({super.key});

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  var checked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            value: checked,
            onChanged: (value) => setState(() {
                  checked = value!;
                }))
      ],
    );
  }

  void checkboxChecked(bool checked) {
    setState(() {
      checked = !checked;
    });
  }
}
