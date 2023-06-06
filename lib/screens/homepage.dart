import 'package:flutter/material.dart';
import 'package:habit_tracker_app/widgets/my_fab.dart';
import 'package:habit_tracker_app/widgets/habit_tile.dart';

import '../widgets/new_habit_dialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List habits = [
    ['Morning Run', false],
    ['Math Study', false],
    ['Workout', false]
  ];

  final _habitNameController = TextEditingController();
  void changeStatus(int index, bool value) {
    setState(() {
      habits[index][1] = value;
    });
    //print('value of ${tasks[index][0]}is now ${tasks[index][1]}');
  }

  void save() {
    setState(() {
      habits.add([_habitNameController.text, false]);
    });
    _habitNameController.clear();
    Navigator.of(context).pop();
  }

  void edit(index) {
    setState(() {
      habits[index][0] = _habitNameController.text;
    });
    _habitNameController.clear();
    Navigator.of(context).pop();
  }

  void cancel() {
    _habitNameController.clear();
    Navigator.of(context).pop();
  }

  void createNewHabit() {
    showDialog(
        context: context,
        builder: (context) => MyHabitDialog(
              hintText: 'Enter a new habit',
              controller: _habitNameController,
              onCancel: cancel,
              onSaved: save,
            ));
  }

  void editHabit(int index) {
    showDialog(
        context: context,
        builder: (context) => MyHabitDialog(
              hintText: habits[index][0],
              controller: _habitNameController,
              onCancel: cancel,
              onSaved: () => edit(index),
            ));
  }

  void deleteHabit(int index) {
    setState(() {
      habits.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: MyFloatingActionButton(onPressed: createNewHabit),
      backgroundColor: Colors.grey[300],
      body: ListView.builder(
        itemCount: habits.length,
        itemBuilder: (context, index) => HabitTile(
            title: habits[index][0],
            habitCompleted: habits[index][1],
            onChanged: (boolValue) => changeStatus(index, boolValue!),
            onEdit: (contextValue) => editHabit(index),
            onDelete: (contextValue) => deleteHabit(index)),
      ),
    );
  }
}
