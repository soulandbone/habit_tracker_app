import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';

class HabitHeatMap extends StatelessWidget {
  const HabitHeatMap({super.key});

  @override
  Widget build(BuildContext context) {
    return HeatMapCalendar(
      initDate: DateTime.now(),
      defaultColor: Colors.white,
      flexible: true,
      colorMode: ColorMode.color,
      datasets: {
        DateTime(2023, 6, 3): 3,
        DateTime(2023, 6, 6): 7,
        DateTime(2023, 6, 8): 10,
        DateTime(2023, 6, 10): 13,
        DateTime(2023, 6, 11): 6,
      },
      colorsets: {
        1: Colors.green.shade100,
        2: Colors.green.shade200,
        3: Colors.green.shade300,
        4: Colors.green.shade400,
        5: Colors.green.shade500,
        6: Colors.green.shade600,
        7: Colors.green.shade700,
        8: Colors.green.shade800,
        9: Colors.green.shade900
      },
      onClick: (value) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(value.toString())));
      },
    );
  }
}
