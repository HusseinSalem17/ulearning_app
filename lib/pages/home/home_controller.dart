import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_app/common/apis/course_api.dart';
import 'package:udemy_app/common/routes/names.dart';
import 'package:udemy_app/common/values/constant.dart';
import 'package:udemy_app/global.dart';
import 'package:udemy_app/pages/application/bloc/app_blocs.dart';
import 'package:udemy_app/pages/application/bloc/app_events.dart';
import 'package:udemy_app/pages/home/bloc/home_page_blocs.dart';
import 'package:udemy_app/pages/home/bloc/home_page_events.dart';
import 'package:udemy_app/pages/sign_in/models/user_item_model.dart';

class HomeController {
  late BuildContext context;
  UserItem get userProfile => Global.storageService.getUserProfile();
  // Singleton instance to make just one instance of the class and just one call for getCourses
  // Not every time the user navigates to the home page make a call to the api
  static final HomeController _singleton = HomeController._internal();
  HomeController._internal();
  // Factory constructor to return the instance of the class
  // makes sure you have the only one original instance of the class
  factory HomeController({required BuildContext context}) {
    _singleton.context = context;
    return _singleton;
  }

  Future<void> init() async {
    print('init HomeController');
    // make sure that user is logged in and then make an api call
    if (Global.storageService.getUserToken().isNotEmpty) {
      context.read<HomePageBlocs>().add(HomePageLoading());
      var result = await CourseAPI.getCourses();
      // debugPrint('the result is: ${result.data![0].name}');
      // context.mounted is used to check if the widget is still mounted (not disposed)
      if (result.statusCode == 200) {
        if (context.mounted) {
          context.read<HomePageBlocs>().add(HomePageCourseItem(result.data!));
          return;
        }
        debugPrint('result.data HomeController: ${result.data}');
      } else if (result.statusCode == 401) {
        _removeUserData();
        if (context.mounted) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil(AppRoutes.SIGN_IN, (route) => false);
        }
        return;
      } else {
        debugPrint('error HomeController: ${result.data}');
        debugPrint('status code HomeController: ${result.statusCode}');
      }
    } else {
      debugPrint('User is not logged in');
    }
    return;
  }

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
}
