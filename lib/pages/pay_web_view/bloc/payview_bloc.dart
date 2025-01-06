import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_app/pages/pay_web_view/bloc/payview_events.dart';
import 'package:udemy_app/pages/pay_web_view/bloc/payview_states.dart';

class PayWebViewBloc extends Bloc<PayWebViewEvents, PayWebViewStates> {
  PayWebViewBloc() : super(const PayWebViewStates()) {
    on<TriggerWebView>(_triggerWebView);
  }
  void _triggerWebView(TriggerWebView event, Emitter<PayWebViewStates> emit) {
    emit(state.copyWith(url: event.url));
  }
}
