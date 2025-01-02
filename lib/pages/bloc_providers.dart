import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_app/pages/register/bloc/register_blocs.dart';
import 'package:udemy_app/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:udemy_app/pages/welcome/bloc/welcome_blocs.dart';

class AppBlocProviders {
  static get allBlocProviders => [
        BlocProvider(
          lazy: false,
          create: (context) => WelcomeBloc(),
        ),
        BlocProvider(
          lazy: false,
          create: (context) => RegisterBloc(),
        ),
        BlocProvider(
          create: (context) => SignInBloc(),
        ),
      ];
}
