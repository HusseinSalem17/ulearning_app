import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:udemy_app/common/utils/http_util.dart';
import 'package:udemy_app/pages/register/models/register_request_model.dart';
import 'package:udemy_app/pages/register/models/register_response_model.dart';
import 'package:udemy_app/pages/sign_in/models/login_request.dart';
import 'package:udemy_app/pages/sign_in/models/login_request_model.dart';

class UserAPI {
  static Future<Response<UserLoginResponseEntity>> login(
      {required LoginRequestEntity data}) async {
    try {
      debugPrint('data: ${data.toJson()}');
      final Response<UserLoginResponseEntity> response = await HttpUtil().post(
        '/api/login/',
        data: data.toJson(),
        fromJson: (json) => UserLoginResponseEntity.fromJson(json),
      );
      debugPrint('hereee finished login');
      debugPrint('response user_api_login: ${response.data}');
      debugPrint('status code user_api_login: ${response.statusCode}');
      return response;
    } catch (e) {
      debugPrint('error user_api_login: $e');
      throw Exception('Login failed');
    }
  }

  static Future<Response<RegisterResponseEntity>> register(
      {required RegisterRequestEntity data}) async {
    try {
      final Response<RegisterResponseEntity> response = await HttpUtil().post(
        '/api/register/',
        data: data.toJson(),
        fromJson: (json) => RegisterResponseEntity.fromJson(json),
      );
      debugPrint('hereee finished register');
      debugPrint('response user_api_register: ${response.data}');
      debugPrint('status code user_api_register: ${response.statusCode}');
      return response;
    } catch (e) {
      debugPrint('error user_api_register: $e');
      throw Exception('Register failed');
    }
  }
}
