import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ticket_trace/core/api.dart';

/// The `EarningCallTranscriptRepository` class is responsible for fetching
/// earning call transcripts from the API.
///
/// It interacts with the `Api` class to send requests and retrieve transcript
/// data for specific companies based on ticker, year, and quarter.
class EarningCallTranscriptRepository {
  /// An instance of the `Api` class used to send requests to the server.
  final Api _api = Api();

  /// Fetches the earning call transcript for a specific company identified by
  /// the provided ticker symbol, year, and quarter.
  ///
  /// This method sends a request to the API and returns the transcript as a
  /// string.
  ///
  /// Parameters:
  /// - `ticker`: A `String` representing the stock ticker symbol of the company.
  /// - `year`: A `String` representing the fiscal year of the earnings call.
  /// - `quarter`: A `String` representing the quarter of the earnings call.
  ///
  /// Returns:
  /// A `Future<String>` containing the earning call transcript for the
  /// specified ticker, year, and quarter.
  ///
  /// Throws:
  /// An exception if there is an error during the API request or response
  /// processing.
  Future<String> getTranscript({
    required String ticker,
    required String year,
    required String quarter,
  }) async {
    try {
      // Send a request to the API to get the earning call transcript data
      Response response = await _api.sendRequest.get(
          "/earningstranscript?ticker=$ticker&year=$year&quarter=$quarter");

      // Return the transcript from the response data
      return response.data['transcript'] as String;
    } catch (e) {
      // Log the exception and rethrow it for further handling in the calling context
      log("Exception caught at Earning Call Transcript Repository => $e. Rethrowing to its corresponding Cubit...");
      rethrow;
    }
  }
}

