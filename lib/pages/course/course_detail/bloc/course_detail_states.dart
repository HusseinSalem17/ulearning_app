import 'package:udemy_app/pages/course/models/course_entity/course_item.dart';
import 'package:udemy_app/pages/course/models/course_entity/lesson_detail.dart';

class CourseDetailStates {
  const CourseDetailStates({
    this.courseItem,
    this.lessonItem = const <LessonDetail>[],
  });

  final CourseItem? courseItem;
  final List<LessonDetail>? lessonItem;

  CourseDetailStates copyWith(
      {CourseItem? courseItem, List<LessonDetail>? lessonItem}) {
    return CourseDetailStates(
      courseItem: courseItem ?? this.courseItem,
      lessonItem: lessonItem ?? this.lessonItem,
    );
  }
}
