import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ticket_trace/core/api.dart';

class EarningCallTranscriptRepository {
  final Api _api = Api();

  Future<String> getTranscript(
      {required String ticker,
      required String year,
      required String quarter}) async {
    try {
      Response response = await _api.sendRequest.get(
          "/earningstranscript?ticker=$ticker&year=$year&quarter=$quarter");

      return response.data['transcript'] as String;
    } catch (e) {
      log("Exception caught at Earning Call Transcript Repository => $e. Rethrowing to its corresponding Cubit...");
      rethrow;
    }
  }
}
