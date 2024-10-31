import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_trace/data/models/earning_call_states.dart';
import 'package:ticket_trace/data/repositories/earning_call_transcript_repository.dart';

class EarningCallCubit extends Cubit<EarningCallStates> {
  EarningCallCubit() : super(EarningCallInitialState());

  final EarningCallTranscriptRepository _earningCallTranscriptRepository =
      EarningCallTranscriptRepository();

  Future<void> fetchEarningCallTranscript(
      {required String ticker,
      required String year,
      required String quarter}) async {
    try {
      emit(EarningCallLoadingState());

      String transcript = await _earningCallTranscriptRepository.getTranscript(
          ticker: ticker, year: year, quarter: quarter);

      emit(EarningCallLoadedState(transcript));
    } catch (e) {
      emit(EarningCallErrorState(e.toString()));
    }
  }
}
