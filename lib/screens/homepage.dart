import 'package:flutter/material.dart';
import 'package:habit_tracker_app/widgets/my_fab.dart';
import 'package:habit_tracker_app/widgets/task_tile.dart';

import '../widgets/new_habit_dialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List tasks = [
    ['Morning Run', false],
    ['Math Study', false],
    ['Workout', false]
  ];

  final _habitNameController = TextEditingController();
  void changeStatus(int index, bool value) {
    setState(() {
      tasks[index][1] = value;
    });
    //print('value of ${tasks[index][0]}is now ${tasks[index][1]}');
  }

  void save(String name) {
    setState(() {
      tasks.add([name, false]);
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
        builder: (context) => NewHabitDialog(
              controller: _habitNameController,
              onCancel: cancel,
              onSaved: () => save(_habitNameController.text),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: MyFloatingActionButton(onPressed: createNewHabit),
        backgroundColor: Colors.grey[300],
        body: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) => TaskTile(
            title: tasks[index][0],
            habitCompleted: tasks[index][1],
            onChangedValue: (value) => changeStatus(index, value!),
          ),
        ));
  }
}
