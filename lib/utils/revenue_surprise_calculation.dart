
import 'package:ticket_trace/data/models/earning_calendar_model.dart';

double revenueSurprise({required List<EarningCalendarModel> earningResults}) {
  double actualRevenue = 0;
  double estimatedRevenue = 0;

  for (var earning in earningResults) {
    actualRevenue += earning.actualRevenue ?? 0;
    estimatedRevenue += earning.estimatedRevenue ?? 0;

  }

  double surprise = (((actualRevenue - estimatedRevenue) / estimatedRevenue) * 100);
  

  return surprise;
}
