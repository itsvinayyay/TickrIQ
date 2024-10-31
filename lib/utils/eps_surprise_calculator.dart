
import 'package:ticket_trace/data/models/earning_calendar_model.dart';

double epsSurprise({required List<EarningCalendarModel> earningResults}) {
  double actualEps = 0;
  double estimatedEps = 0;

  for (var earning in earningResults) {
    actualEps += earning.actualEps ?? 0;
    estimatedEps += earning.estimatedEps ?? 0;

  }

  double surprise = (((actualEps - estimatedEps) / estimatedEps) * 100);
  

  return surprise;
}
