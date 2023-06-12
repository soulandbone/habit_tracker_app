//reference the box

import 'package:habit_tracker_app/helpers/dateHelpers.dart';
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
      //first day loading the list, it has to reset all the values to false
      todaysHabitList = myBox.get('CURRENT_HABIT_LIST');
      for (int i = 0; i < todaysHabitList.length; i++) {
        todaysHabitList[i][1] = false;
      }
    } else {
      todaysHabitList = myBox.get(
          todaysDate); //assumes that it takes the list, but if its a new day the list needs to load with all values on false (because the habits have reset)
    }
  }

  double calculatePercentage(List list) {
    int doneHabits = 0;
    for (var habit in list) {
      // every habit is a List Object, where index 0 is the name of the habit, and index 1, is the boolean of whether is it completed or not
      if (habit[1]) {
        doneHabits++;
      }
    }
    return list.isEmpty
        ? 0.0
        : (doneHabits /
            list.length); //to avoid problems of dividing by zero in cases when all the items of the list have been deleted.
  }

  Map<DateTime, int>? calculateDataSets(Box box) {
    Map<DateTime, int>? dataSets = {};

    for (var element in box.keys) {
      if (element.length == 8) {
        // it is a date
        var date = DateHelpers.stringToDate(
            element); //create the DateTime object from the String
        var number = ((calculatePercentage(box.get(element)) * 10)).round();
        dataSets[date] = number;
      }
    }
    return dataSets;
  }
}
