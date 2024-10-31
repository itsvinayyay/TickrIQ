import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class Api {
  final Dio _dio = Dio();

  Api() {
    _dio.options.baseUrl = dotenv.env['BASE_URL']!;
    _dio.options.headers = {'X-Api-Key': dotenv.env['API_KEY']!};
    _dio.interceptors.add(
      PrettyDioLogger(
          requestBody: true,
          requestHeader: true,
          responseBody: true,
          responseHeader: true),
    );
  }

  Dio get sendRequest => _dio;
}

class ApiResponse {
  dynamic data;
  ApiResponse({required this.data});

  factory ApiResponse.fromResponse(Response response) {
    return ApiResponse(data: response);
  }
}
