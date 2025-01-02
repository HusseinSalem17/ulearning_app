import 'package:udemy_app/pages/course/models/course_entity/course_item.dart';

abstract class HomePageEvents {
  const HomePageEvents();
}

class HomePageDots extends HomePageEvents {
  final int index;
  const HomePageDots(this.index);
}

class HomePageCourseItem extends HomePageEvents {
  final List<CourseItem> courseItem;
  const HomePageCourseItem(this.courseItem);
}

class HomePageLoading extends HomePageEvents {}
