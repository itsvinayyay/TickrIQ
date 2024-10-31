import 'package:ticket_trace/data/models/earning_calendar_model.dart';

/// An abstract class representing the various states of the earning calendar
/// results fetching process.
///
/// This class maintains a list of earning results that can be accessed by
/// its subclasses.
abstract class EarningCalendarStates {
  /// A list of earning calendar results associated with the current state.
  final List<EarningCalendarModel> earningResults;

  /// Constructs an instance of `EarningCalendarStates` with the provided
  /// list of earning results.
  EarningCalendarStates(this.earningResults);
}

/// Represents the initial state of the earning calendar process.
///
/// This state indicates that no earning results have been loaded yet.
class EarningInitialState extends EarningCalendarStates {
  /// Constructs an instance of `EarningInitialState` with an empty list
  /// of earning results.
  EarningInitialState() : super([]);
}

/// Represents the state when the earning results data is currently being loaded.
///
/// This state informs the UI that a loading process is underway.
class EarningLoadingState extends EarningCalendarStates {
  /// Constructs an instance of `EarningLoadingState` with the current list
  /// of earning results.
  EarningLoadingState(super.earningResults);
}

/// Represents the state when the earning results have been successfully loaded.
///
/// This state contains the loaded earning results for further use.
class EarningLoadedState extends EarningCalendarStates {
  /// Constructs an instance of `EarningLoadedState` with the loaded list
  /// of earning results.
  EarningLoadedState(super.earningResults);
}

/// Represents the state when an error occurs during the fetching or processing
/// of earning results.
///
/// This state contains an error message to provide context about the failure.
class EarningErrorState extends EarningCalendarStates {
  /// The error message describing what went wrong during the process.
  final String errorMessage;

  /// Constructs an instance of `EarningErrorState` with the current list
  /// of earning results and the provided error message.
  EarningErrorState(super.earningResults, this.errorMessage);
}
