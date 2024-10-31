import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_trace/cubits/earning_calendar_cubit/earning_calendar_states.dart';
import 'package:ticket_trace/data/models/earning_calendar_model.dart';
import 'package:ticket_trace/data/repositories/earning_calendar_repository.dart';

class EarningCalendarCubit extends Cubit<EarningCalendarStates> {
  EarningCalendarCubit() : super(EarningInitialState());

  final EarningCalendarRepository _earningCalendarRepository =
      EarningCalendarRepository();

  Future<void> fetchEarningResults({required String ticker}) async {
    try {
      emit(EarningLoadingState(state.earningResults));

      List<EarningCalendarModel> earningResults =
          await _earningCalendarRepository.getEarningResults(ticker: ticker);

      emit(EarningLoadedState(earningResults));
    } catch (e) {
      emit(EarningErrorState(state.earningResults, e.toString()));
    }
  }
}
