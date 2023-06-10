//reference the box

import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

const habitsDatabase = "Habits_Database";

class HabitDataBase {
  String todaysDate = DateFormat('yyyyMMdd').format(DateTime.now());
  List todaysHabitList = [];

  var myBox = Hive.box("Habits_Database");

  void createDefaultData() {
    todaysHabitList = [
      ['Run', false],
      ['Write novel', false],
      ['Yoga', false],
    ];
    myBox.put('START_DATE', todaysDate);
  }

  void updateDatabase() {
    myBox.put(todaysDate, todaysHabitList);

    myBox.put("CURRENT_HABIT_LIST", todaysHabitList);
  }

  void loadDatabase() {
    if (myBox.get(todaysDate) == null) {
      todaysHabitList = myBox.get('CURRENT_HABIT_LIST');
      for (int i = 0; i < todaysHabitList.length; i++) {
        todaysHabitList[i][1] = false;
      }
    } else {
      todaysHabitList = myBox.get(
          todaysDate); //assumes that it takes the list, but if its a new day the list needs to load with all values on false (because the habits have reset)
    }
  }
}
