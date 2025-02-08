import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:qoute_train/core/api/status_code.dart';
import 'package:qoute_train/core/error/exceptions.dart';
import 'package:qoute_train/core/api/api_consumer.dart';
import 'package:qoute_train/core/api/app_interceptors.dart';
import 'package:qoute_train/core/api/end_points.dart';
import 'package:qoute_train/injection.dart' as di;

class DioConsumer implements ApiConsumer {
  final Dio client;

  DioConsumer({required this.client}) {
    // Bypass SSL certificate validation (for development only)
    if (!kReleaseMode) {
      (client.httpClientAdapter as IOHttpClientAdapter)
          // ignore: deprecated_member_use
          .onHttpClientCreate = (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };
    }

    // Configure Dio options
    client.options
      ..baseUrl = EndPoints.baseUrl
      ..responseType = ResponseType.json // Use JSON for JSON APIs
      ..followRedirects = false
      ..validateStatus = (status) {
        return status! < StatusCode.internalServerError;
      };

    // Add interceptors
    client.interceptors.add(di.sl<AppIntercepters>());
    if (kDebugMode) {
      client.interceptors.add(
        LogInterceptor(
          request: true,
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true,
          error: true,
        ),
      );
    }
  }

  @override
  Future<dynamic> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      log('Fetching data from: $path'); // Log the path
      final response = await client.get(path, queryParameters: queryParameters);
      log('Response received: ${response.statusCode}'); // Log the status code
      return _handleResponseAsJson(response);
    } on DioException catch (error) {
      log('DioException occurred: ${error.message}'); // Log the error
      _handleDioException(error);
      rethrow;
    }
  }

  @override
  Future<dynamic> post(
    String path, {
    Map<String, dynamic>? body,
    bool formDataIsEnabled = false,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await client.post(
        path,
        queryParameters: queryParameters,
        data: formDataIsEnabled ? FormData.fromMap(body!) : body,
      );
      return _handleResponseAsJson(response);
    } on DioException catch (error) {
      _handleDioException(error);
      rethrow; // Rethrow the exception after handling
    }
  }

  @override
  Future<dynamic> put(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await client.put(
        path,
        queryParameters: queryParameters,
        data: body,
      );
      return _handleResponseAsJson(response);
    } on DioException catch (error) {
      _handleDioException(error);
      rethrow; // Rethrow the exception after handling
    }
  }

  // Handle JSON response
  dynamic _handleResponseAsJson(Response<dynamic> response) {
    try {
      if (response.data is String) {
        return jsonDecode(response.data);
      }
      return response.data;
    } catch (e) {
      throw const FormatException('Invalid JSON response');
    }
  }

  // Handle Dio exceptions
  void _handleDioException(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw const FetchDataException();
      case DioExceptionType.badResponse:
        switch (error.response?.statusCode) {
          case StatusCode.badRequest:
            throw const BadRequestException();
          case StatusCode.unauthorized:
          case StatusCode.forbidden:
            throw const UnauthorizedException();
          case StatusCode.notFound:
            throw const NotFoundException();
          case StatusCode.conflict:
            throw const ConflictException();
          case StatusCode.internalServerError:
            throw const InternalServerErrorException();
          default:
            throw const ServerException();
        }
      case DioExceptionType.cancel:
        break;
      case DioExceptionType.unknown:
        if (error.error is SocketException) {
          throw const NoInternetConnectionException();
        } else {
          throw const ServerException();
        }
      case DioExceptionType.badCertificate:
        throw const BadCertificateException();
      case DioExceptionType.connectionError:
        throw const ConnectionErrorException();
    }
  }
}
