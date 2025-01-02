extension TimeExtensions on DateTime{
  String get dayName{
    List<String> days=[
      "Sat",
      "Sun",
      "Mon",
      "Tue",
      "Wed",
      "Thr",
      "Fri",
    ];
    return days[weekday-1];
  }
}