/// Determines the quarter of the year for a given date string.
///
/// This function takes a date in string format, parses it into a `DateTime`
/// object, and returns the corresponding quarter of the year as an integer.
///
/// Quarters are defined as follows:
/// - Q1: January to March
/// - Q2: April to June
/// - Q3: July to September
/// - Q4: October to December
///
/// Parameters:
/// - `date`: A `String` representing the date in ISO 8601 format (e.g., "2023-01-15").
///
/// Returns:
/// An `int` representing the quarter of the year (1, 2, 3, or 4).
///
/// Example:
/// ```dart
/// int quarter = getQuarter("2024-04-15"); // Returns 2
/// ```
int getQuarter(String date) {
  // Parse the input date string into a DateTime object
  DateTime parsedDate = DateTime.parse(date);

  // Get the month from the parsed DateTime object
  int month = parsedDate.month;

  // Determine the quarter based on the month
  if (month >= 1 && month <= 3) {
    return 1; // Q1
  } else if (month >= 4 && month <= 6) {
    return 2; // Q2
  } else if (month >= 7 && month <= 9) {
    return 3; // Q3
  } else {
    return 4; // Q4
  }
}

