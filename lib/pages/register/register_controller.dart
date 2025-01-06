import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_app/common/widgets/toast_info.dart';
import 'package:udemy_app/pages/register/bloc/register_blocs.dart';
import 'package:udemy_app/pages/register/models/register_request_model.dart';
import 'package:udemy_app/common/apis/user_api.dart';
import 'package:udemy_app/common/routes/names.dart';
import 'package:udemy_app/pages/register/models/register_response_model.dart';

class RegisterController {
  final BuildContext context;
  const RegisterController(this.context);

  void handleEmailRegister() async {
    final state = context.read<RegisterBloc>().state;
    String userName = state.userName;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;

    if (userName.isEmpty) {
      toastInfo(msg: 'User name can not be empty');
      return;
    }

    if (email.isEmpty) {
      toastInfo(msg: 'Email can not be empty');
      return;
    }

    if (password.isEmpty) {
      toastInfo(msg: 'Password can not be empty');
      return;
    }

    if (password != rePassword) {
      toastInfo(msg: 'Passwords do not match');
      return;
    }

    try {
      RegisterRequestEntity registerRequestEntity = RegisterRequestEntity(
        name: userName,
        email: email,
        password: password,
      );

      final Response<RegisterResponseEntity> response = await UserAPI.register(data: registerRequestEntity);
      debugPrint('Response register_controller: ${response.statusCode}');
      if (response.statusCode == 201) {
        toastInfo(msg: 'Registration successful');
        if (context.mounted) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            AppRoutes.SIGN_IN,
            (route) => false,
          );
        }
      } else {
        toastInfo(msg: 'Registration failed');
      }
    } catch (e) {
      toastInfo(msg: 'error register_controller: $e');
    }
  }
}
