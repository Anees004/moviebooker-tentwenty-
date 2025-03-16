import 'package:intl/intl.dart';

String formatDate(String dateString) {
  DateTime dateTime = DateTime.parse(dateString);
  return DateFormat('MMMM d, y').format(dateTime); // e.g., March 28, 2025
}

DateTime convertToDateComponents(String dateString) {
  // Ensure the date string is in the correct format
  try {
    DateTime dateTime = DateFormat(
      'MMMM d, y',
    ).parse(dateString); // Adjust format if needed
    return dateTime; // Return the DateTime object
  } catch (e) {
    print("Error parsing date: $e");
    return DateTime.now(); // Return current date or handle error as needed
  }
}
