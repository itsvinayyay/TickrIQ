
import 'package:ticket_trace/data/models/earning_calendar_model.dart';

double epsGrowth({required List<EarningCalendarModel> earningResults}) {
  final double mostRecentEps = earningResults[0].actualEps ?? 0;
  final double earliestEps =earningResults[earningResults.length-1].actualEps ?? 0 ;

  

  double growth = (((mostRecentEps - earliestEps) / earliestEps) * 100);
  

  return growth;
}
