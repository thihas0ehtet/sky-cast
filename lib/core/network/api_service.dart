import 'package:dio/dio.dart';
import 'package:sky_cast/core/network/base_request.dart';
import 'package:sky_cast/core/network/base_response.dart';
import 'package:sky_cast/core/utils/utils.dart';

class ApiService {
  final String baseUrl;
  late final Dio _dio;

  ApiService(this.baseUrl) {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          Utils.print(
            "Request: ${options.method} ${options.baseUrl}${options.path}",
          );

          Utils.print("QueryParameters: ${options.queryParameters}");
          if (options.data != null) {
            Utils.print("Data: ${options.data}");
          }

          handler.next(options);
        },
        onResponse: (response, handler) {
          Utils.print("Response : ${response.statusCode}");

          handler.next(response);
        },
        onError: (DioException e, handler) {
          Utils.print(
            "Error occurred: ${e.message}",
            printType: PrintType.error,
          );
          handler.next(e);
        },
      ),
    );
  }

  Future<Response> _request(
    String path, {
    required String method,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final requestData = (data is BaseRequest) ? data.toJson() : data;

      return await _dio.request(
        path,
        data: requestData,
        queryParameters: queryParameters,
        options: Options(method: method, headers: data),
      );
    } on DioException catch (e) {
      throw Exception('Failed request: ${e.message}');
    }
  }

  List<T> _processListResponse<T extends BaseResponse>(
    Response response,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    if (response.data is List) {
      return (response.data as List)
          .map((e) => fromJson(e as Map<String, dynamic>))
          .toList();
    } else {
      throw const FormatException('Response is not a list');
    }
  }

  Future<List<T>> _handleListRequest<T extends BaseResponse>(
    String path, {
    required String method,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    final response = await _request(
      path,
      method: method,
      data: data,
      queryParameters: queryParameters,
      headers: headers,
    );
    return _processListResponse(response, fromJson);
  }

  Future<T?> _handleRequest<T extends BaseResponse?>(
    String path, {
    required String method,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    T Function(Map<String, dynamic>)? fromJson,
  }) async {
    final response = await _request(
      path,
      method: method,
      data: data,
      queryParameters: queryParameters,
      headers: headers,
    );
    if (fromJson != null) {
      return fromJson(response.data);
    }
    return null;
  }

  Future<List<T>> getList<T extends BaseResponse>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    return _handleListRequest(
      path,
      method: 'GET',
      queryParameters: queryParameters,
      headers: headers,
      fromJson: fromJson,
    );
  }

  Future<T?> get<T extends BaseResponse?>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    T Function(Map<String, dynamic>)? fromJson,
  }) async {
    return _handleRequest<T>(
      path,
      method: 'GET',
      queryParameters: queryParameters,
      headers: headers,
      fromJson: fromJson,
    );
  }
}
