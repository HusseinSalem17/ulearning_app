import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:udemy_app/common/apis/user_api.dart';
import 'package:udemy_app/common/routes/names.dart';
import 'package:udemy_app/common/values/constant.dart';
import 'package:udemy_app/common/widgets/toast_info.dart';
import 'package:udemy_app/pages/register/bloc/register_blocs.dart';
import 'package:udemy_app/pages/register/models/register_request_model.dart';

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
    if (rePassword.isEmpty) {
      toastInfo(msg: 'Re-Password can not be empty');
      return;
    }
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user != null) {
        await credential.user!.sendEmailVerification();
        await credential.user!.updateDisplayName(userName);
        String photoUrl = "${AppConstants.SERVER_API_URL}/media/default.png";
        toastInfo(msg: 'Please verify your email');
        await credential.user!.updatePhotoURL(photoUrl);
        RegisterRequestEntity registerRequestEntity = RegisterRequestEntity(
          name: userName,
          email: email,
          password: password,
        );

        await asyncPostAllData(registerRequestEntity);
        Navigator.of(context).pop();
      }
    } catch (e) {
      print('error: $e');
      toastInfo(msg: 'Something went wrong');
    }
  }

  Future<void> asyncPostAllData(
      RegisterRequestEntity registerRequestEntity) async {
    try {
      EasyLoading.show(status: 'loading...');
      final Response<dynamic> response =
          await UserAPI.register(data: registerRequestEntity);
      if (response.statusCode == 201) {
        toastInfo(msg: response.data['msg']);
        Navigator.of(context).pushNamed(AppRoutes.REGISTER);
      } else {
        toastInfo(msg: 'Register failed');
      }
    } catch (e) {
      print('error: $e');
      toastInfo(msg: 'Something went wrong');
    } finally {
      EasyLoading.dismiss();
    }
  }
}
