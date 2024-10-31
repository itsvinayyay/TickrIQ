import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ticket_trace/core/api.dart';
import 'package:ticket_trace/data/models/earning_calendar_model.dart';

class EarningCalendarRepository {
  final Api _api = Api();

  Future<List<EarningCalendarModel>> getEarningResults(
      {required String ticker}) async {
    try {
      Response response =
          await _api.sendRequest.get('/earningscalendar?ticker=$ticker');

      List<EarningCalendarModel> earningResults = (response.data as List)
          .map((data) =>
              EarningCalendarModel.fromJson(data as Map<String, dynamic>))
          .toList();

      return earningResults;
    } catch (e) {
      log("Exception caught at Earning Calendar Repository => $e. Rethrowing to its corresponding Cubit...");
      rethrow;
    }
  }
}
