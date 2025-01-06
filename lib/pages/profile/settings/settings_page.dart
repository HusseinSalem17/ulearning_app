import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_app/common/routes/names.dart';
import 'package:udemy_app/common/values/constant_api.dart';
import 'package:udemy_app/common/widgets/build_app_bar_reusable.dart';
import 'package:udemy_app/global.dart';
import 'package:udemy_app/pages/application/bloc/app_blocs.dart';
import 'package:udemy_app/pages/application/bloc/app_events.dart';
import 'package:udemy_app/pages/home/bloc/home_page_blocs.dart';
import 'package:udemy_app/pages/home/bloc/home_page_events.dart';
import 'package:udemy_app/pages/profile/settings/bloc/settings_blocs.dart';
import 'package:udemy_app/pages/profile/settings/bloc/settings_states.dart';
import 'package:udemy_app/pages/profile/settings/widgets/settings_button_widget.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  void _removeUserData(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      AppRoutes.SIGN_IN,
      (route) => false,
    );
    context.read<AppBlocs>().add(const TriggerAppEvent(0));
    context.read<HomePageBlocs>().add(const HomePageDots(0));
    // Delay the removal of user data to avoid errors in the home page
    Future.delayed(const Duration(milliseconds: 10), () {
      Global.storageService.remove(AppConstants.STORAGE_USER_TOKEN_KEY);
      Global.storageService.remove(AppConstants.STORAGE_USER_PROFILE_KEY);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBarReusable('Settings'),
      body: SingleChildScrollView(
        child: BlocBuilder<SettingsBlocs, SettingsStates>(
          builder: (context, state) {
            return Column(
              children: [
                settingsButton(context, () => _removeUserData(context)),
              ],
            );
          },
        ),
      ),
    );
  }
}
