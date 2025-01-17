import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_app/pages/course/course_detail/bloc/course_detail_events.dart';
import 'package:udemy_app/pages/course/course_detail/bloc/course_detail_states.dart';

class CourseDetailBloc extends Bloc<CourseDetailEvents, CourseDetailStates> {
  CourseDetailBloc() : super(const CourseDetailStates()) {
    on<TriggerCourseDetail>(_triggerCourseDetail);
    on<TriggerLessonList>(_triggerLessonList);
  }

  void _triggerCourseDetail(
      TriggerCourseDetail event, Emitter<CourseDetailStates> emit) {
    emit(state.copyWith(courseItem: event.courseItem));
  }

  void _triggerLessonList(
      TriggerLessonList event, Emitter<CourseDetailStates> emit) {
    emit(state.copyWith(lessonItem: event.lessonItem));
  }
}
