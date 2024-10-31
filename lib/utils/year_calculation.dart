/// Extracts the year from a given date string.
///
/// This function takes a date in string format, parses it into a `DateTime`
/// object, and returns the year as a string.
///
/// Parameters:
/// - `date`: A required `String` representing the date in ISO 8601 format
///   (e.g., "2023-01-15").
///
/// Returns:
/// A `String` representing the year extracted from the provided date.
///
/// Example:
/// ```dart
/// String year = getYear(date: "2024-04-15"); // Returns "2024"
/// ```
String getYear({required String date}) {
  // Parse the input date string into a DateTime object
  DateTime parsedDate = DateTime.parse(date);

  // Return the year as a string
  return parsedDate.year.toString();
}

