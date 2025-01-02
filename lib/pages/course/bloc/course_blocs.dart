import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_app/pages/course/bloc/course_events.dart';
import 'package:udemy_app/pages/course/bloc/course_states.dart';

class CourseBlocs extends Bloc<CourseEvents, CourseStates> {
  CourseBlocs() : super(const CourseStates()) {
    on<TriggerCourse>(_triggerCourseDetail);
  }

  void _triggerCourseDetail(TriggerCourse event, Emitter<CourseStates> emit) {
    emit(state.copyWith(courseItem: event.courseItem));
  }
}
