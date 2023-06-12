class DateHelpers {
  static DateTime stringToDate(String date) {
    String year = date.substring(0, 4);
    String month = date.substring(4, 6);
    String day = date.substring(6, 8);

    if (day.startsWith('0')) {
      day = day.substring(1, 2);
    }
    if (month.startsWith('0')) {
      month = month.substring(1, 2);
    }

    DateTime dateTime =
        DateTime(int.parse(year), int.parse(month), int.parse(day));
    print('String year is $year');
    print('String month is $month');
    print('String day is $day');
    return dateTime;
  }
}
