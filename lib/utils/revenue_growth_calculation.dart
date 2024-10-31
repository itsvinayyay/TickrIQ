import 'package:ticket_trace/data/models/earning_calendar_model.dart';

/// Calculates the revenue growth percentage based on the provided list of
/// earning results.
///
/// The function compares the most recent actual revenue with the earliest 
/// estimated revenue in the provided list and returns the growth as a 
/// percentage.
///
/// Parameters:
/// - `earningResults`: A required list of `EarningCalendarModel` instances
///   that contain the actual and estimated revenue values.
///
/// Returns:
/// A `double` representing the revenue growth percentage. If the earliest 
/// revenue is zero, it returns zero to avoid division by zero.
///
/// Example:
/// ```dart
/// double growth = revenueGrowth(earningResults: myEarningResults);
/// ```
double revenueGrowth({required List<EarningCalendarModel> earningResults}) {
  // Get the most recent actual revenue from the first element of the list
  final int mostRecentRevenue = earningResults[0].actualRevenue ?? 0;
  
  // Get the earliest estimated revenue from the last element of the list
  final int earliestRevenue = 
      earningResults[earningResults.length - 1].estimatedRevenue ?? 0;

  // Calculate the revenue growth percentage
  double growth = (((mostRecentRevenue - earliestRevenue) / earliestRevenue) * 100);

  return growth;
}

