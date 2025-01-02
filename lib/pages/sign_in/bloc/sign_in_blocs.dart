import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_app/pages/sign_in/bloc/sign_in_events.dart';
import 'package:udemy_app/pages/sign_in/bloc/sign_in_states.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(const SignInState()) {
    on<EmailEvent>(_emailEvent);
    on<PasswordlEvent>(_passwordEvent);
  }
  void _emailEvent(EmailEvent event, Emitter<SignInState> emit) {
    print('my email is ${event.email}');
    emit(
      state.copyWith(
        email: event.email,
      ),
    );
  }

  void _passwordEvent(PasswordlEvent event, Emitter<SignInState> emit) {
    print('my password is ${event.password}');
    emit(
      state.copyWith(
        password: event.password,
      ),
    );
  }
}
