import 'package:intl/intl.dart';

String getCurrentFormattedDate() {
  // Get the current date as DateTime object
  DateTime currentDate = DateTime.now();

  // Create a DateFormat object to format the date
  DateFormat dateFormat = DateFormat('EEEE, d MMMM y', 'en_US');

  // Format the date
  String formattedDate = dateFormat.format(currentDate);

  return formattedDate;
}
