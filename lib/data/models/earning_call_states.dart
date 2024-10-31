abstract class EarningCallStates {}

class EarningCallLoadedState extends EarningCallStates {
  final String transcript;

  EarningCallLoadedState(this.transcript);
}

class EarningCallInitialState extends EarningCallStates {
  // This state could represent the initial state before any data is loaded.
}

class EarningCallLoadingState extends EarningCallStates {
  // This state indicates that the earnings call data is currently being loaded.
}

class EarningCallErrorState extends EarningCallStates {
  final String errorMessage;

  EarningCallErrorState(this.errorMessage);
  // This state handles errors that occur during data fetching or processing.
}
