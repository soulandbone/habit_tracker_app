import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:habit_tracker_app/helpers/dateHelpers.dart';

import '../helpers/boxes.dart';

class HabitHeatMap extends StatelessWidget {
  final Map<DateTime, int>? datasets;

  HabitHeatMap({required this.datasets, super.key});

  @override
  Widget build(BuildContext context) {
    return HeatMapCalendar(
      initDate: DateHelpers.stringToDate(box.get('START_DATE')),
      textColor: Colors.brown,
      defaultColor: Colors.white,
      flexible: true,
      colorMode: ColorMode.color,
      showColorTip: false,
      datasets: datasets,
      colorsets: const {
        1: Color.fromARGB(20, 7, 143, 11),
        2: Color.fromARGB(49, 7, 143, 11),
        3: Color.fromARGB(77, 7, 143, 11),
        4: Color.fromARGB(106, 7, 143, 11),
        5: Color.fromARGB(134, 7, 143, 11),
        6: Color.fromARGB(163, 7, 143, 11),
        7: Color.fromARGB(191, 7, 143, 11),
        8: Color.fromARGB(220, 7, 143, 11),
        9: Color.fromARGB(228, 7, 143, 11),
        10: Color.fromARGB(255, 7, 143, 11),
      },
      onClick: (value) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(value.toString())));
      },
    );
  }

  final box = Boxes.getHabits();
}
