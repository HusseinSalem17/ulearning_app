import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:udemy_app/common/routes/routes.dart';
import 'package:udemy_app/common/values/constant_api.dart';
import 'package:udemy_app/common/widgets/toast_info.dart';
import 'package:udemy_app/pages/home/home_controller.dart';
import 'package:udemy_app/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:udemy_app/pages/sign_in/models/login_request.dart';
import 'package:udemy_app/pages/sign_in/models/login_request_model.dart';

import '../../common/apis/user_api.dart';
import '../../global.dart';

class SignInController {
  final BuildContext context;
  SignInController({
    required this.context,
  });

  Future<void> handleSignIn(String type) async {
    try {
      if (type == 'email') {
        final state = context.read<SignInBloc>().state;
        String emailAdrees = state.email;
        String password = state.password;
        if (emailAdrees.isEmpty) {
          toastInfo(msg: "You need to fill email address");
          return;
        }
        if (password.isEmpty) {
          toastInfo(msg: "You need to fill password");
          return;
        }
        try {
          LoginRequestEntity loginRequestEntity = LoginRequestEntity(
            email: emailAdrees,
            password: password,
          );

          await asyncPostAllData(loginRequestEntity);
          if (context.mounted) {
            await HomeController(context: context).init();
          }
        } catch (e) {
          toastInfo(msg: 'Login failed: $e');
        }
      }
    } catch (e) {
      toastInfo(msg: 'An error occurred: $e');
    }
  }

  Future<void> asyncPostAllData(LoginRequestEntity loginRequestEntity) async {
    EasyLoading.show(
      indicator: const CircularProgressIndicator(),
      maskType: EasyLoadingMaskType.clear,
      dismissOnTap: true,
    );
    try {
      final Response<UserLoginResponseEntity> response =
          await UserAPI.login(data: loginRequestEntity);
      if (response.statusCode == 200 && response.data != null) {
        try {
          debugPrint('data hereee: ${response.data!.toJson()}');
          debugPrint('response hereee: ${response.data!.user!.toJson()}');
          debugPrint('response hereee: ${response.data!.access_token!}');

          Global.storageService.setString(AppConstants.STORAGE_USER_PROFILE_KEY,
              jsonEncode(response.data!.user));
          Global.storageService.setString(AppConstants.STORAGE_USER_TOKEN_KEY,
              response.data!.access_token!);
          if (context.mounted) {
            debugPrint('here 4');
            Navigator.of(context).pushNamedAndRemoveUntil(
              AppRoutes.APPLICATION,
              (route) => false,
            );
          }
        } catch (e) {
          debugPrint('saving token error: ${e.toString()}');
        } finally {
          EasyLoading.dismiss();
        }
      } else {
        toastInfo(msg: 'Login failed');
        EasyLoading.dismiss();
      }
    } catch (e) {
      debugPrint('error: $e');
    } finally {
      EasyLoading.dismiss();
    }
  }
}
