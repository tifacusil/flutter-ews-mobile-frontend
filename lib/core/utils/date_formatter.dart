import 'package:intl/intl.dart';

class DateFormatter {
  const DateFormatter._();

  static final _dateTime = DateFormat('yyyy-MM-dd HH:mm');
  static final _dateOnly = DateFormat('yyyy-MM-dd');
  static final _chartLabel = DateFormat('MM/dd');
  static final _monthYear = DateFormat('MMM yyyy');

  static String toDisplay(DateTime dt) => _dateTime.format(dt);

  static String toDateOnly(DateTime dt) => _dateOnly.format(dt);

  /// Short label for chart X-axis ticks (e.g. "05/02").
  static String toChartLabel(DateTime dt) => _chartLabel.format(dt);

  /// Month + year label for zoomed-out views (e.g. "Apr 2019").
  static String toMonthYear(DateTime dt) => _monthYear.format(dt);
}
