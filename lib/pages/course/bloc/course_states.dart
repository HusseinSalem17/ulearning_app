import 'package:udemy_app/pages/course/models/course_entity/course_item.dart';

class CourseStates {
  const CourseStates({this.courseItem});

  final CourseItem? courseItem;

  CourseStates copyWith({CourseItem? courseItem}) {
    return CourseStates(
      courseItem: courseItem ?? this.courseItem,
    );
  }
}
