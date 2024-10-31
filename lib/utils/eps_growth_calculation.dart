import 'package:ticket_trace/data/models/earning_calendar_model.dart';

/// Calculates the earnings per share (EPS) growth percentage based on the
/// provided list of earning results.
///
/// The function compares the most recent EPS with the earliest EPS in the
/// provided list and returns the growth as a percentage.
///
/// Parameters:
/// - `earningResults`: A required list of `EarningCalendarModel` instances
///   that contain the actual EPS values.
///
/// Returns:
/// A `double` representing the EPS growth percentage. If the earliest EPS
/// is zero, it returns zero to avoid division by zero.
///
/// Example:
/// ```dart
/// double growth = epsGrowth(earningResults: myEarningResults);
/// ```
double epsGrowth({required List<EarningCalendarModel> earningResults}) {
  // Get the most recent actual EPS from the first element of the list
  final double mostRecentEps = earningResults[0].actualEps ?? 0;
  
  // Get the earliest actual EPS from the last element of the list
  final double earliestEps = earningResults[earningResults.length - 1].actualEps ?? 0;

  // Calculate the EPS growth percentage
  double growth = (((mostRecentEps - earliestEps) / earliestEps) * 100);

  return growth;
}

