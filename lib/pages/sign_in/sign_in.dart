import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udemy_app/common/routes/names.dart';
import 'package:udemy_app/common/widgets/build_app_bar_auth.dart';
import 'package:udemy_app/common/widgets/build_login_register_button.dart';
import 'package:udemy_app/common/widgets/build_text_field.dart';
import 'package:udemy_app/common/widgets/build_third_party_auth.dart';
import 'package:udemy_app/common/widgets/forget_password.dart';
import 'package:udemy_app/pages/sign_in/sign_in_controller.dart';

import '../../common/widgets/reusable_text.dart';
import '../../constants.dart';
import 'bloc/sign_in_blocs.dart';
import 'bloc/sign_in_events.dart';
import 'bloc/sign_in_states.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: buildAppBarAuth('Log In'),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildThiredPartyAuth(context),
                    Center(
                      child: reusableText(
                        'Or use your email account login',
                        margin: EdgeInsets.only(bottom: 5.h),
                        color: Colors.grey.withOpacity(0.5),
                        fontWeight: FontWeight.normal,
                        fontSize: 14.sp,
                      ),
                    ),
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(
                          top: 36.h,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            reusableText(
                              'Email',
                              margin: EdgeInsets.only(bottom: 5.h),
                              color: Colors.grey.withOpacity(0.5),
                              fontWeight: FontWeight.normal,
                              fontSize: 14.sp,
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            buildTextField(
                              "Enter your email address",
                              "email",
                              AssetsHelper.IC_USER,
                              (value) {
                                context
                                    .read<SignInBloc>()
                                    .add(EmailEvent(value));
                              },
                            ),
                            reusableText(
                              'Password',
                              margin: EdgeInsets.only(bottom: 5.h),
                              color: Colors.grey.withOpacity(0.5),
                              fontWeight: FontWeight.normal,
                              fontSize: 14.sp,
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            buildTextField(
                              "Enter your password",
                              "password",
                              AssetsHelper.IC_LOCK,
                              (value) {
                                context
                                    .read<SignInBloc>()
                                    .add(PasswordlEvent(value));
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    forgotPassword(),
                    SizedBox(
                      height: 70.h,
                    ),
                    buildLogInAndRegButton("Log in", "login", () {
                      debugPrint('here noowww');
                      SignInController(context: context).handleSignIn('email');
                    }),
                    buildLogInAndRegButton("Sign Up", "register", () {
                      Navigator.of(context).pushNamed(AppRoutes.REGISTER);
                    }),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
