
import 'package:ticket_trace/data/models/earning_calendar_model.dart';

double revenueGrowth({required List<EarningCalendarModel> earningResults}) {
  final int mostRecentRevenue = earningResults[0].actualRevenue ?? 0;
  final int earliestRevenue =earningResults[earningResults.length-1].estimatedRevenue ?? 0 ;

  

  double growth = (((mostRecentRevenue - earliestRevenue) / earliestRevenue) * 100);
  

  return growth;
}
