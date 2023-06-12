class DateHelpers {
  static DateTime stringToDate(String date) {
    String year = date.substring(0, 4);
    String month = date.substring(4, 6);
    String day = date.substring(6, 8);

    if (day.startsWith('0')) {
      day = day.substring(0, 2);
    }
    if (month.startsWith('0')) {
      month = month.substring(0, 2);
    }

    DateTime dateTime =
        DateTime(int.parse(year), int.parse(month), int.parse(day));

    return dateTime;
  }
}
