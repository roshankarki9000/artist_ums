import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime? {
  DateTime formatToDateTime({String? format}) {
    var defaultFormat = format ?? 'yyyy-MM-dd';
    return DateFormat(
      defaultFormat,
    ).parse(formatToDateTimeString(format: defaultFormat));
  }

  String formatToDateTimeString({String? format}) {
    try {
      var defaultFormat = format ?? 'yyyy-MM-dd';
      String initialData = '';

      if (defaultFormat.contains('dth')) {
        var suffix = "th";
        var digit = this!.day % 10;
        if ((digit > 0 && digit < 4) && (this!.day < 11 || this!.day > 13)) {
          suffix = ["st", "nd", "rd"][digit - 1];
        }
        defaultFormat = defaultFormat.replaceAll('dth', "d'$suffix'");
      }

      initialData = DateFormat(defaultFormat).format(this!);
      return initialData.toString();
    } catch (e) {
      return 'could not format date';
    }
  }

  num get getWorkingDaysTillNow {
    DateTime now = DateTime.now();
    var startDate = this!;
    if (startDate.isAfter(now)) return 0; // future date

    int totalDays =
        now.difference(startDate).inDays + 1; // +1 to include start day
    int fullWeeks = totalDays ~/ 7;
    int extraDays = totalDays % 7;

    // Calculate weekdays in full weeks
    int workingDays = fullWeeks * 5;

    // Handle extra days (partial week)
    for (int i = 0; i < extraDays; i++) {
      DateTime day = startDate.add(Duration(days: fullWeeks * 7 + i));
      if (day.weekday != DateTime.saturday && day.weekday != DateTime.sunday) {
        workingDays++;
      }
    }

    return workingDays;
  }
}
