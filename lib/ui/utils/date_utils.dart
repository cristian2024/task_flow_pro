import 'package:intl/intl.dart';

final DateFormat _dateFormat = DateFormat("yyyy-MM-dd");
final DateFormat _timeFormat = DateFormat("hh:mm");

extension DateUtils on DateTime {
  String formatDate() {
    return _dateFormat.format(this);
  }

  String formatTime() {
    return _timeFormat.format(this);
  }

  String fullFormatDate() {
    return "${formatDate()}, ${formatTime()}";
  }
}
