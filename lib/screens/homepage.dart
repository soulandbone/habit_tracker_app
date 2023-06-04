import 'package:flutter/material.dart';
import 'package:habit_tracker_app/widgets/task_tile.dart';

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

  void changeStatus(int index, bool value) {
    setState(() {
      tasks[index][1] = value;
    });
    print('value is now $value');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Habit Tracker')),
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
