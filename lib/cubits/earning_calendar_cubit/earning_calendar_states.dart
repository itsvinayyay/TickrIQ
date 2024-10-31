import 'package:ticket_trace/data/models/earning_calendar_model.dart';

abstract class EarningCalendarStates {
  final List<EarningCalendarModel> earningResults;

  EarningCalendarStates(this.earningResults);
}

class EarningInitialState extends EarningCalendarStates {
  EarningInitialState() : super([]);
}

class EarningLoadingState extends EarningCalendarStates {
  EarningLoadingState(super.earningResults);
}

class EarningLoadedState extends EarningCalendarStates {
  EarningLoadedState(super.earningResults);
}

class EarningErrorState extends EarningCalendarStates {
  EarningErrorState(super.earningResults, this.errorMessage);
  final String errorMessage;
}
