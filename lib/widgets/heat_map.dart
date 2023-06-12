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
      defaultColor: Colors.white,
      flexible: true,
      colorMode: ColorMode.color,
      datasets: datasets,
      colorsets: {
        1: Colors.green.shade50,
        2: Colors.green.shade100,
        3: Colors.green.shade200,
        4: Colors.green.shade300,
        5: Colors.green.shade400,
        6: Colors.green.shade500,
        7: Colors.green.shade600,
        8: Colors.green.shade700,
        9: Colors.green.shade800,
        10: Colors.green.shade900,
      },
      onClick: (value) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(value.toString())));
      },
    );
  }

  var box = Boxes.getHabits();
}
