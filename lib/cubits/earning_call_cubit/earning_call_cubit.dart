import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_trace/cubits/earning_call_cubit/earning_call_states.dart';
import 'package:ticket_trace/data/repositories/earning_call_transcript_repository.dart';

/// The `EarningCallCubit` class manages the state of earning call transcripts
/// using the Cubit state management pattern.
///
/// It extends the `Cubit` class and maintains the state of earning call operations,
/// such as loading transcripts and handling errors.
class EarningCallCubit extends Cubit<EarningCallStates> {
  /// Constructs an instance of `EarningCallCubit` with an initial state of
  /// `EarningCallInitialState`.
  EarningCallCubit() : super(EarningCallInitialState());

  /// A private instance of `EarningCallTranscriptRepository` to interact with
  /// the data layer for fetching earning call transcripts.
  final EarningCallTranscriptRepository _earningCallTranscriptRepository =
      EarningCallTranscriptRepository();

  /// Fetches the earning call transcript for a specific company identified by
  /// the provided ticker symbol, year, and quarter.
  ///
  /// Throws an error if the transcript fetching fails.
  ///
  /// Parameters:
  /// - `ticker`: A `String` representing the stock ticker symbol of the company.
  /// - `year`: A `String` representing the fiscal year of the earnings call.
  /// - `quarter`: A `String` representing the quarter of the earnings call.
  Future<void> fetchEarningCallTranscript({
    required String ticker,
    required String year,
    required String quarter,
  }) async {
    try {
      // Emit a loading state before fetching the transcript
      emit(EarningCallLoadingState());

      // Fetch the transcript from the repository
      String transcript = await _earningCallTranscriptRepository.getTranscript(
        ticker: ticker,
        year: year,
        quarter: quarter,
      );

      // Emit the loaded state with the fetched transcript
      emit(EarningCallLoadedState(transcript));
    } catch (e) {
      // Emit an error state if fetching fails
      emit(EarningCallErrorState(e.toString()));
    }
  }
}

