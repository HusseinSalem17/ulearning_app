import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:udemy_app/common/routes/routes.dart';
import 'package:udemy_app/common/values/constant.dart';
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
        //BlocProvider.of<SignInBloc>(context).state   (This equal the below) (state => SignInState) (can reach events and states using state)
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
          final credential =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailAdrees,
            password: password,
          );
          debugPrint('here 1');
          if (credential.user == null) {
            toastInfo(msg: "You don't exist");
            return;
          }
          if (!credential.user!.emailVerified) {
            toastInfo(msg: "You need to verify your email");
            return;
          }
          var user = credential.user;
          if (user != null) {
            String? displayName = user.displayName;
            String? email = user.email;
            String? id = user.uid;
            String? photoUrl = user.photoURL;
            debugPrint('here 2');

            LoginRequestEntity loginRequestEntity = LoginRequestEntity(
              email: email,
              password: password,
            );
            debugPrint('here 3');

            await asyncPostAllData(loginRequestEntity);
            if (context.mounted) {
              await HomeController(context: context).init();
            }

            // we got verified user from firebase
          } else {
            toastInfo(msg: "Currently you are not a user of this app");
            return;
          }
        } on FirebaseAuthException catch (e) {
          if (e.message == 'user-not-found') {
            toastInfo(msg: 'No user Founde for this email');
          } else if (e.message == 'wrong-password') {
            toastInfo(msg: 'Wrong Password for this email');
          } else if (e.message == 'invalid-email') {
            toastInfo(msg: 'Your emial address format is wrong');
          } else if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
            toastInfo(msg: 'Login credentials are invalid.');
          } else if (e.message == 'user-disabled') {
            toastInfo(msg: 'User Disabled');
          } else if (e.message == 'too-many-requests') {
            toastInfo(msg: 'Too Many Requests');
          } else {
            debugPrint('Error ${e.message}');
          }
        }
      }
    } catch (e) {}
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
          //Used for authorization, that's why we saved it.
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
