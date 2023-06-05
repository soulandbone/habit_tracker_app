import 'package:flutter/material.dart';
import 'package:habit_tracker_app/widgets/new_habit_dialog.dart';

class MyFloatingActionButton extends StatelessWidget {
  VoidCallback onPressed;
  MyFloatingActionButton({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: Icon(Icons.add),
    );
  }
}
