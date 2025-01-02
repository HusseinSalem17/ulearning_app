import 'package:udemy_app/pages/course/models/course_entity/course_item.dart';

abstract class CourseEvents {
  const CourseEvents();
}

class TriggerCourse extends CourseEvents {
  final CourseItem courseItem;
  const TriggerCourse({required this.courseItem}) : super();
}
