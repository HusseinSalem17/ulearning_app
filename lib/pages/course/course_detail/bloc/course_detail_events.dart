import 'package:udemy_app/pages/course/models/course_entity/course_item.dart';
import 'package:udemy_app/pages/course/models/course_entity/lesson_detail.dart';

abstract class CourseDetailEvents {
  const CourseDetailEvents();
}

class TriggerCourseDetail extends CourseDetailEvents {
  final CourseItem courseItem;
  const TriggerCourseDetail({required this.courseItem}) : super();
}

class TriggerLessonList extends CourseDetailEvents {
  final List<LessonDetailModel> lessonItem;
  const TriggerLessonList({required this.lessonItem}) : super();
}
