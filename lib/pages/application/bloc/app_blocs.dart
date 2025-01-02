import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_app/pages/application/bloc/app_states.dart';

import 'app_events.dart';

class AppBlocs extends Bloc<AppEvent, AppState> {
  AppBlocs() : super(const AppState()) {
    on<TriggerAppEvent>((event, emit) => emit(AppState(index: event.index)));
  }
}
