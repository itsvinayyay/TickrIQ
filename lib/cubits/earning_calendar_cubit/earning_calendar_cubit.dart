import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_trace/cubits/earning_calendar_cubit/earning_calendar_states.dart';
import 'package:ticket_trace/data/models/earning_calendar_model.dart';
import 'package:ticket_trace/data/repositories/earning_calendar_repository.dart';

/// The `EarningCalendarCubit` class manages the state of earning results
/// using the Cubit state management pattern.
///
/// It extends the `Cubit` class and maintains the state of earning results
/// operations, including loading results and handling errors.
class EarningCalendarCubit extends Cubit<EarningCalendarStates> {
  /// Constructs an instance of `EarningCalendarCubit` with an initial state
  /// of `EarningInitialState`.
  EarningCalendarCubit() : super(EarningInitialState());

  /// A private instance of `EarningCalendarRepository` to interact with
  /// the data layer for fetching earning results.
  final EarningCalendarRepository _earningCalendarRepository =
      EarningCalendarRepository();

  /// Fetches the earning results for a specific company identified by the
  /// provided ticker symbol.
  ///
  /// This method emits different states based on the success or failure of
  /// the data fetching operation.
  ///
  /// Parameters:
  /// - `ticker`: A `String` representing the stock ticker symbol of the company.
  Future<void> fetchEarningResults({required String ticker}) async {
    try {
      // Emit a loading state with the current earning results
      emit(EarningLoadingState(state.earningResults));

      // Fetch the earning results from the repository
      List<EarningCalendarModel> earningResults =
          await _earningCalendarRepository.getEarningResults(ticker: ticker);

      // Emit the loaded state with the fetched earning results
      emit(EarningLoadedState(earningResults));
    } catch (e) {
      // Emit an error state if fetching fails
      emit(EarningErrorState(state.earningResults, e.toString()));
    }
  }
}

