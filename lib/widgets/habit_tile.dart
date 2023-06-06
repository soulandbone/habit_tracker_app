import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HabitTile extends StatelessWidget {
  //final int index;
  final String title;
  final bool habitCompleted;
  final Function(bool?) onChanged;
  final Function(BuildContext) onEdit;
  final Function(BuildContext) onDelete;

  HabitTile(
      {required this.title,
      required this.habitCompleted,
      required this.onChanged,
      required this.onEdit,
      required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
            onPressed: onEdit,
            backgroundColor: Colors.grey.shade800,
            icon: Icons.edit,
            borderRadius: BorderRadius.circular(12),
          ),
          SlidableAction(
            onPressed: onDelete,
            backgroundColor: Colors.red.shade400,
            icon: Icons.delete,
            borderRadius: BorderRadius.circular(12),
          )
        ]),
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
              color: Colors.grey[100], borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
              Checkbox(value: habitCompleted, onChanged: onChanged),
              Text(title)
            ],
          ),
        ),
      ),
    );
  }
}
