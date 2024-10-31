import 'package:ticket_trace/data/models/earning_calendar_model.dart';

/// Calculates the earnings per share (EPS) surprise percentage based on
/// the provided list of earning results.
///
/// This function sums the actual and estimated EPS values from the list of
/// `EarningCalendarModel` instances and calculates the surprise as a
/// percentage based on the difference between the actual and estimated EPS.
///
/// Parameters:
/// - `earningResults`: A required list of `EarningCalendarModel` instances
///   that contain the actual and estimated EPS values.
///
/// Returns:
/// A `double` representing the EPS surprise percentage. If the estimated EPS
/// is zero, it returns zero to avoid division by zero.
///
/// Example:
/// ```dart
/// double surprise = epsSurprise(earningResults: myEarningResults);
/// ```
double epsSurprise({required List<EarningCalendarModel> earningResults}) {
  double actualEps = 0;
  double estimatedEps = 0;

  // Iterate through the earning results and sum the actual and estimated EPS
  for (var earning in earningResults) {
    actualEps += earning.actualEps ?? 0;       // Sum actual EPS
    estimatedEps += earning.estimatedEps ?? 0; // Sum estimated EPS
  }

  // Calculate the EPS surprise percentage
  double surprise = (((actualEps - estimatedEps) / estimatedEps) * 100);

  return surprise;
}

