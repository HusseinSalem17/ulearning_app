import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:udemy_app/common/values/constant_api.dart';
import 'package:udemy_app/global.dart';

class HttpUtil {
  static final HttpUtil _instance = HttpUtil._internal();

  factory HttpUtil() => _instance;

  late Dio dio;

  HttpUtil._internal() {
    BaseOptions options = BaseOptions(
      baseUrl: AppConstants.SERVER_API_URL,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      responseType: ResponseType.json,
    );
    dio = Dio(options);
  }

  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    required T Function(dynamic) fromJson,
    Options? options,
  }) async {
    try {
      debugPrint('First getMethod');
      Options requestOptions = options ?? Options();
      requestOptions.headers = requestOptions.headers ?? {};
      Map<String, dynamic>? authorization = getAuthorizationHeader();
      if (authorization != null) {
        requestOptions.headers!.addAll(authorization);
      }
      debugPrint(
        'reach here getMethod path: $path queryParameters: $queryParameters requestOptions: ${requestOptions.headers}',
      );

      Response response = await dio.get(
        path,
        queryParameters: queryParameters,
        options: requestOptions,
      );
      debugPrint('response.data getMethod: ${response.data}');
      debugPrint('status code getMethod: ${response.statusCode}');
      return Response<T>(
        data: fromJson(response.data),
        requestOptions: response.requestOptions,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
        headers: response.headers,
      );
    } on DioException catch (e) {
      debugPrint('Dio exception: $e');
      return Response<T>(
        requestOptions: e.response!.requestOptions,
        statusCode: e.response!.statusCode,
        statusMessage: e.response!.statusMessage,
        headers: e.response!.headers,
      );
    } catch (e) {
      debugPrint('error getMethod: $e');
      return Response(requestOptions: RequestOptions(path: ''));
    }
  }

  Future<Response<T>> post<T>(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    required T Function(dynamic) fromJson,
    Options? options,
  }) async {
    try {
      Options requestOptions = options ?? Options();
      requestOptions.headers = requestOptions.headers ?? {};
      Map<String, dynamic>? authorization = getAuthorizationHeader();
      if (authorization != null) {
        requestOptions.headers!.addAll(authorization);
      }
      Response response = await dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: requestOptions,
      );
      debugPrint('response.data postMethod: ${response.data}');
      // debugPrint('reponse.data["url"]: ${response.data["data"]["url"]}');
      return Response<T>(
        data: fromJson(response.data),
        requestOptions: response.requestOptions,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
        headers: response.headers,
      );
    } on DioException catch (e) {
      debugPrint('Dio exception: $e');
      if (e.response != null) {
        return Response<T>(
          data: fromJson(e.response!.data),
          requestOptions: e.response!.requestOptions,
          statusCode: e.response!.statusCode,
          statusMessage: e.response!.statusMessage,
          headers: e.response!.headers,
        );
      } else {
        throw Exception('Failed to post data');
      }
    } catch (e) {
      debugPrint('error: $e');
      return Response(requestOptions: RequestOptions(path: ''));
    }
  }

  Map<String, dynamic>? getAuthorizationHeader() {
    // this headers ex: {Authorization: Bearer $token}
    var headers = <String, dynamic>{};
    var accessToken = Global.storageService.getUserToken();
    if (accessToken.isNotEmpty) {
      debugPrint('accessToken HERE: $accessToken');
      headers['Authorization'] = 'Bearer $accessToken';
    }
    return headers;
  }
}
