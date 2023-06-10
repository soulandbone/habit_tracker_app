import 'package:hive_flutter/hive_flutter.dart';

class Boxes {
  static Box getHabits() => Hive.box("Habits_Database");
}
