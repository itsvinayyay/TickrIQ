import 'package:ticket_trace/data/models/earning_calendar_model.dart';

/// Calculates the revenue surprise percentage based on the provided list of
/// earning results.
///
/// This function sums the actual and estimated revenue values from the list
/// of `EarningCalendarModel` instances and calculates the surprise as a
/// percentage based on the difference between the actual and estimated revenue.
///
/// Parameters:
/// - `earningResults`: A required list of `EarningCalendarModel` instances
///   that contain the actual and estimated revenue values.
///
/// Returns:
/// A `double` representing the revenue surprise percentage. If the estimated 
/// revenue is zero, it returns zero to avoid division by zero.
///
/// Example:
/// ```dart
/// double surprise = revenueSurprise(earningResults: myEarningResults);
/// ```
double revenueSurprise({required List<EarningCalendarModel> earningResults}) {
  double actualRevenue = 0;      // Variable to hold the sum of actual revenue
  double estimatedRevenue = 0;    // Variable to hold the sum of estimated revenue

  // Iterate through the earning results and sum the actual and estimated revenue
  for (var earning in earningResults) {
    actualRevenue += earning.actualRevenue ?? 0;       // Sum actual revenue
    estimatedRevenue += earning.estimatedRevenue ?? 0; // Sum estimated revenue
  }

  // Calculate the revenue surprise percentage
  double surprise = (((actualRevenue - estimatedRevenue) / estimatedRevenue) * 100);

  return surprise;
}

