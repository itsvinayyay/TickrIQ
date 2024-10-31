import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ticket_trace/core/api.dart';
import 'package:ticket_trace/data/models/earning_calendar_model.dart';

/// The `EarningCalendarRepository` class is responsible for fetching earning
/// results data from the API.
///
/// It interacts with the `Api` class to send requests and retrieve data
/// related to earning calendars for specific companies.
class EarningCalendarRepository {
  /// An instance of the `Api` class used to send requests to the server.
  final Api _api = Api();

  /// Fetches the earning results for a specific company identified by the
  /// provided ticker symbol.
  ///
  /// This method sends a request to the API and processes the response to
  /// return a list of `EarningCalendarModel` instances.
  ///
  /// Parameters:
  /// - `ticker`: A `String` representing the stock ticker symbol of the company.
  ///
  /// Returns:
  /// A `Future<List<EarningCalendarModel>>` containing the earning results
  /// for the specified ticker.
  ///
  /// Throws:
  /// An exception if there is an error during the API request or response
  /// processing.
  Future<List<EarningCalendarModel>> getEarningResults({
    required String ticker,
  }) async {
    try {
      // Send a request to the API to get earning calendar data for the specified ticker
      Response response =
          await _api.sendRequest.get('/earningscalendar?ticker=$ticker');

      // Map the response data to a list of EarningCalendarModel instances
      List<EarningCalendarModel> earningResults = (response.data as List)
          .map((data) =>
              EarningCalendarModel.fromJson(data as Map<String, dynamic>))
          .toList();

      return earningResults;
    } catch (e) {
      // Log the exception and rethrow it for further handling in the calling context
      log("Exception caught at Earning Calendar Repository => $e. Rethrowing to its corresponding Cubit...");
      rethrow;
    }
  }
}

