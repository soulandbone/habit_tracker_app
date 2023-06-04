import 'package:flutter/material.dart';
import 'package:habit_tracker_app/widgets/new_habit_dialog.dart';

class MyFloatingActionButton extends StatelessWidget {
  const MyFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => openNewHabit(context),
      child: Icon(Icons.add),
    );
  }

  void openNewHabit(BuildContext context) {
    showDialog(context: context, builder: (context) => NewHabitDialog());
  }
}
