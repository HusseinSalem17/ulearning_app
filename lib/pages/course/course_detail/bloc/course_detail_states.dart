import 'package:udemy_app/pages/course/models/course_entity/course_item.dart';
import 'package:udemy_app/pages/course/models/course_entity/lesson_detail.dart';

class CourseDetailStates {
  const CourseDetailStates({
    this.courseItem,
    this.lessonItem = const <LessonDetailModel>[],
  });

  final CourseItem? courseItem;
  final List<LessonDetailModel>? lessonItem;

  CourseDetailStates copyWith(
      {CourseItem? courseItem, List<LessonDetailModel>? lessonItem}) {
    return CourseDetailStates(
      courseItem: courseItem ?? this.courseItem,
      lessonItem: lessonItem ?? this.lessonItem,
    );
  }
}
