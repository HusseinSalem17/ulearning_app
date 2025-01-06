import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udemy_app/common/widgets/build_app_bar_auth.dart';
import 'package:udemy_app/common/widgets/build_login_register_button.dart';
import 'package:udemy_app/common/widgets/build_text_field.dart';
import 'package:udemy_app/pages/register/bloc/register_blocs.dart';
import 'package:udemy_app/pages/register/bloc/register_events.dart';
import 'package:udemy_app/pages/register/register_controller.dart';

import '../../common/widgets/reusable_text.dart';
import '../../common/values/assest_helper.dart';
import 'bloc/register_states.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterStates>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: buildAppBarAuth('Sign Up'),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20.h),
                    Center(
                      child: reusableText(
                          'Enter your details below and free sign up'),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 60.h,
                      ),
                      padding: EdgeInsets.only(left: 25.w, right: 25.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          reusableText('User name'),
                          buildTextField(
                            "Enter your user name",
                            "name",
                            AssetsHelper.IC_USER,
                            (value) {
                              context
                                  .read<RegisterBloc>()
                                  .add(UserNameEvent(value));
                            },
                          ),
                          reusableText('Email'),
                          buildTextField(
                            "Enter your email address",
                            "email",
                            AssetsHelper.IC_USER,
                            (value) {
                              context
                                  .read<RegisterBloc>()
                                  .add(EmailEvent(value));
                            },
                          ),
                          reusableText('Password'),
                          buildTextField(
                            "Enter your password",
                            "password",
                            AssetsHelper.IC_LOCK,
                            (value) {
                              context
                                  .read<RegisterBloc>()
                                  .add(PasswordEvent(value));
                            },
                          ),
                          reusableText('Re-enter password'),
                          buildTextField(
                            "Re-enter your password to confirm",
                            "password",
                            AssetsHelper.IC_LOCK,
                            (value) {
                              context
                                  .read<RegisterBloc>()
                                  .add(RePasswordEvent(value));
                            },
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25.w),
                      child: reusableText(
                        'By creating an account, you agree to our Terms of Service and Privacy Policy',
                        margin: EdgeInsets.only(bottom: 5.h),
                        color: Colors.grey.withOpacity(0.5),
                        fontWeight: FontWeight.normal,
                        fontSize: 14.sp,
                      ),
                    ),
                    buildLogInAndRegButton("Sign Up", "login", () {
                      RegisterController(context).handleEmailRegister();
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
