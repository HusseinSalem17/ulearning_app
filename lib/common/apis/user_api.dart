import 'package:dio/dio.dart';
import 'package:udemy_app/common/utils/http_util.dart';
import 'package:udemy_app/pages/register/models/register_request_model.dart';
import 'package:udemy_app/pages/sign_in/models/login_request.dart';
import 'package:udemy_app/pages/sign_in/models/login_request_model.dart';

class UserAPI {
  static Future<Response<UserLoginResponseEntity>> login(
      {required LoginRequestEntity data}) async {
    try {
      print('data: ${data.toJson()}');
      final Response<UserLoginResponseEntity> response = await HttpUtil().post(
        '/api/login/',
        data: data.toJson(),
        fromJson: (json) => UserLoginResponseEntity.fromJson(json),
      );
      print('hereee finished login');
      print('response33: ${response.data!.access_token}');
      print('response33: ${response.data}');
      print('status code Login Failed: ${response.statusCode}');
      return response;
    } catch (e) {
      print('error: $e');
      throw Exception('Login failed');
    }
  }

  static Future<dynamic> register({required RegisterRequestEntity data}) async {
    try {
      final Response response = await HttpUtil().post(
        '/api/register/',
        data: data.toJson(),
        fromJson: (json) => UserLoginResponseEntity.fromJson(json),
      );
      print('hereee finished register');
      print(response.data);
      return response;
    } catch (e) {
      print('error: $e');
      return null;
    }
  }
}
