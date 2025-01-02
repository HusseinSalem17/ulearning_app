import 'package:udemy_app/pages/course/models/course_entity/course_item.dart';

class HomePageStates {
  const HomePageStates({
    this.courseItem = const <CourseItem>[],
    this.index = 0,
    this.isLoading = false,
  });

  final int index;
  final List<CourseItem> courseItem;
  final bool isLoading;

  HomePageStates copyWith({
    int? index,
    List<CourseItem>? courseItem,
    bool? isLoading,
  }) {
    return HomePageStates(
      courseItem: courseItem ?? this.courseItem,
      index: index ?? this.index,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
