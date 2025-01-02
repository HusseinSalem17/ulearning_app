import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_page_events.dart';
import 'home_page_states.dart';

class HomePageBlocs extends Bloc<HomePageEvents, HomePageStates> {
  HomePageBlocs() : super(const HomePageStates()) {
    on<HomePageDots>(_homePageDots);
    on<HomePageCourseItem>(_homePageCourseItem);
    on<HomePageLoading>(_homePageLoading);
  }

  void _homePageDots(HomePageDots event, Emitter<HomePageStates> emit) {
    emit(state.copyWith(index: event.index));
  }

  void _homePageCourseItem(
      HomePageCourseItem event, Emitter<HomePageStates> emit) {
    emit(state.copyWith(courseItem: event.courseItem, isLoading: false));
  }

  void _homePageLoading(HomePageLoading event, Emitter<HomePageStates> emit) {
    emit(state.copyWith(isLoading: true));
  }
}
