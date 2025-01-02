import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_app/common/values/constant.dart';
import 'package:udemy_app/common/widgets/build_app_bar_reusable.dart';
import 'package:udemy_app/pages/application/bloc/app_events.dart';
import 'package:udemy_app/pages/home/bloc/home_page_blocs.dart';
import 'package:udemy_app/pages/home/bloc/home_page_events.dart';
import 'package:udemy_app/pages/profile/settings/widgets/settings_button_widget.dart';

import '../../../common/routes/names.dart';
import '../../../global.dart';
import '../../application/bloc/app_blocs.dart';
import 'bloc/settings_blocs.dart';
import 'bloc/settings_states.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  void _removeUserData() {
    context.read<AppBlocs>().add(const TriggerAppEvent(0));
    context.read<HomePageBlocs>().add(const HomePageDots(0));
    Global.storageService.remove(
      AppConstants.STORAGE_USER_TOKEN_KEY,
    );
    Global.storageService.remove(
      AppConstants.STORAGE_USER_PROFILE_KEY,
    );
    Navigator.of(context).pushNamedAndRemoveUntil(
      AppRoutes.SIGN_IN,
      (route) => false,
    );
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
                settingsButton(context, _removeUserData),
              ],
            );
          },
        ),
      ),
    );
  }
}
