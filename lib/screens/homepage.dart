import 'package:flutter/material.dart';
import 'package:habit_tracker_app/data/habit_database.dart';
import 'package:habit_tracker_app/helpers/boxes.dart';
import 'package:habit_tracker_app/widgets/heat_map.dart';
import 'package:habit_tracker_app/widgets/my_fab.dart';
import 'package:habit_tracker_app/widgets/habit_tile.dart';

import '../widgets/new_habit_dialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HabitDataBase database = HabitDataBase();

  var box = Boxes.getHabits();

  @override
  void initState() {
    if (box.get('CURRENT_HABIT_LIST') == null) {
      //there is not a new habit list defined.
      database.createDefaultData();
      print(
          'Default data is executed'); //if the list has been updated, this executes
    } else {
      database.loadDatabase();
    }

    super.initState();
  }

  final _habitNameController = TextEditingController();
  void changeStatus(int index, bool value) {
    setState(() {
      database.todaysHabitList[index][1] = value;
    });
    //print('value of ${tasks[index][0]}is now ${tasks[index][1]}');
    database.updateDatabase();
  }

  void save() {
    setState(() {
      database.todaysHabitList.add([_habitNameController.text, false]);
    });
    _habitNameController.clear();
    database.updateDatabase();
    Navigator.of(context).pop();
  }

  void edit(index) {
    setState(() {
      database.todaysHabitList[index][0] = _habitNameController.text;
    });
    _habitNameController.clear();
    database.updateDatabase();
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
    database.updateDatabase();
  }

  void editHabit(int index) {
    showDialog(
        context: context,
        builder: (context) => MyHabitDialog(
              hintText: database.todaysHabitList[index][0],
              controller: _habitNameController,
              onCancel: cancel,
              onSaved: () => edit(index),
            ));
  }

  void deleteHabit(int index) {
    setState(() {
      database.todaysHabitList.removeAt(index);
    });
    database.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    print(
      'box keys are ${box.keys} and values are ${box.values}',
    );
    print(
        'The completion number for the day 20230610 is ${database.calculatePercentage(box.get('20230610'))}');
    print('the datasets are ${database.calculateDataSets(box)} ');
    // print(
    //     'The number of entries that are dates are ${database.calculateDataSets(box)}');
    return Scaffold(
      floatingActionButton: MyFloatingActionButton(onPressed: createNewHabit),
      backgroundColor: Colors.grey[300],
      body: ListView(children: [
        HabitHeatMap(
          datasets: database.calculateDataSets(box),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: database.todaysHabitList.length,
          itemBuilder: (context, index) => HabitTile(
              title: database.todaysHabitList[index][0],
              habitCompleted: database.todaysHabitList[index][1],
              onChanged: (boolValue) => changeStatus(index, boolValue!),
              onEdit: (contextValue) => editHabit(index),
              onDelete: (contextValue) => deleteHabit(index)),
        ),
      ]),
    );
  }
}
