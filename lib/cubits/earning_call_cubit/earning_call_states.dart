/// An abstract class representing the various states of the earning call
/// transcript fetching process.
abstract class EarningCallStates {}

/// Represents the state when the earning call transcript has been successfully
/// loaded.
///
/// This class contains the loaded transcript data.
class EarningCallLoadedState extends EarningCallStates {
  /// The transcript of the earning call.
  final String transcript;

  /// Constructs an instance of `EarningCallLoadedState` with the provided
  /// transcript.
  EarningCallLoadedState(this.transcript);
}

/// Represents the initial state of the earning call process.
///
/// This state indicates that no data has been loaded yet.
class EarningCallInitialState extends EarningCallStates {
  // This state could represent the initial state before any data is loaded.
}

/// Represents the state when the earning call data is currently being loaded.
///
/// This state is used to inform the UI that a loading process is underway.
class EarningCallLoadingState extends EarningCallStates {
  // This state indicates that the earnings call data is currently being loaded.
}

/// Represents the state when an error occurs during the fetching or processing
/// of earning call data.
///
/// This class contains the error message to provide context about the failure.
class EarningCallErrorState extends EarningCallStates {
  /// The error message describing what went wrong during the process.
  final String errorMessage;

  /// Constructs an instance of `EarningCallErrorState` with the provided
  /// error message.
  EarningCallErrorState(this.errorMessage);
  // This state handles errors that occur during data fetching or processing.
}
