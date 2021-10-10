import 'package:intl/intl.dart';
import 'string.utils.dart';

class DateUtil {
  String getLongMonthAndYear(String date) {
    var formatted = DateFormat('dd/MM/yyyy').parse(date);
    return DateFormat('MMMM', 'pt_BR').format(formatted).capitalize() +
        " / " +
        DateFormat('yyyy', 'pt_BR').format(formatted);
  }

  String getDayAndMonth(String date) {
    var formatted = DateFormat('dd/MM/yyyy').parse(date);
    return DateFormat('dd/MM', 'pt_BR').format(formatted);
  }
}
