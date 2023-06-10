import 'package:flutter/material.dart';
import 'package:habit_tracker_app/screens/homepage.dart';
import 'package:hive_flutter/hive_flutter.dart';

const habitsDatabase = "Habits_Database";
void main() async {
  await Hive.initFlutter();

  await Hive.openBox(habitsDatabase);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.green
            // colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            // useMaterial3: true,
            ),
        home: HomePage());
  }
}
