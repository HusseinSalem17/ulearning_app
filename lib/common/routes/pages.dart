import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_app/common/routes/names.dart';
import 'package:udemy_app/global.dart';
import 'package:udemy_app/pages/application/application_page.dart';
import 'package:udemy_app/pages/application/bloc/app_blocs.dart';
import 'package:udemy_app/pages/course/course_detail/bloc/course_detail_blocs.dart';
import 'package:udemy_app/pages/course/course_detail/course_detail.dart';
import 'package:udemy_app/pages/lesson/bloc/lesson_blocs.dart';
import 'package:udemy_app/pages/lesson/lesson_detail.dart';
import 'package:udemy_app/pages/pay_web_view/bloc/payview_bloc.dart';
import 'package:udemy_app/pages/pay_web_view/paywebview.dart';
import 'package:udemy_app/pages/home/bloc/home_page_blocs.dart';
import 'package:udemy_app/pages/home/home_page.dart';
import 'package:udemy_app/pages/profile/settings/bloc/settings_blocs.dart';
import 'package:udemy_app/pages/profile/settings/settings_page.dart';
import 'package:udemy_app/pages/register/bloc/register_blocs.dart';
import 'package:udemy_app/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:udemy_app/pages/welcome/welcome.dart';
import '../../pages/register/register.dart';
import '../../pages/sign_in/sign_in.dart';
import '../../pages/welcome/bloc/welcome_blocs.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
        route: AppRoutes.INITIAL,
        page: const Welcome(),
        blocProvider: BlocProvider(
          create: (_) => WelcomeBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.SIGN_IN,
        page: const SignIn(),
        blocProvider: BlocProvider(
          create: (_) => SignInBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.REGISTER,
        page: const Register(),
        blocProvider: BlocProvider(
          create: (_) => RegisterBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.APPLICATION,
        page: const ApplicationPage(),
        blocProvider: BlocProvider(
          create: (_) => AppBlocs(),
        ),
      ),
      PageEntity(
        route: AppRoutes.HOME_PAGE,
        page: const HomePage(),
        blocProvider: BlocProvider(
          create: (_) => HomePageBlocs(),
        ),
      ),
      PageEntity(
        route: AppRoutes.SETTINGS,
        page: const SettingsPage(),
        blocProvider: BlocProvider(
          create: (_) => SettingsBlocs(),
        ),
      ),
      PageEntity(
        route: AppRoutes.COURSE_DETAIL,
        page: const CourseDetail(),
        blocProvider: BlocProvider(
          create: (_) => CourseDetailBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.PAY_WEB_VIEW,
        page: const PayWebView(),
        blocProvider: BlocProvider(
          create: (_) => PayWebViewBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.LESSON_DETAIL,
        page: const LessonDetail(),
        blocProvider: BlocProvider(
          create: (_) => LessonBlocs(),
        ),
      ),
    ];
  }

  // return all the bloc providers
  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()) {
      blocProviders.add(bloc.blocProvider);
    }
    return blocProviders;
  }

  // a model that covers entire screen as we click on navigator object
  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      // check for route name matches when naviagtor gets triggered
      var result =
          routes().where((element) => element.route == settings.name).toList();
      if (result.isNotEmpty) {
        debugPrint('route name ${settings.name}');
        bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();
        if (result.first.route == AppRoutes.INITIAL && deviceFirstOpen) {
          bool isLoggedIn = Global.storageService.getIsLoggedIn();
          if (isLoggedIn) {
            return MaterialPageRoute(
              builder: (_) => const ApplicationPage(),
              settings: settings,
            );
          }

          return MaterialPageRoute(
            builder: (_) => const SignIn(),
            settings: settings,
          );
        }
        debugPrint('valid route name ${settings.name}');
        return MaterialPageRoute(
          builder: (_) => result.first.page,
          settings: settings,
        );
      }
    }
    debugPrint('Invalid route name ${settings.name}');
    return MaterialPageRoute(
      builder: (_) => const Welcome(),
      settings: settings,
    );
  }
}

// unify blocProvider and routes and pages
class PageEntity {
  String route;
  Widget page;
  dynamic blocProvider;

  PageEntity({
    required this.route,
    required this.page,
    this.blocProvider,
  });
}
