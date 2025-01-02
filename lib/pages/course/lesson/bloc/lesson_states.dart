import 'package:udemy_app/pages/course/models/course_entity/lesson_detail.dart';

class LessonStates {
  final LessonDetail? lessonItem;
  final Future<void>? initVideoPlayerFuture;
  final bool isPlay;

  const LessonStates({
    this.lessonItem ,
    this.isPlay = false,
    this.initVideoPlayerFuture,
  });

  LessonStates copyWith({
    LessonDetail? lessonItem,
    Future<void>? initVideoPlayerFuture,
    bool? isPlay,
  }) {
    return LessonStates(
      lessonItem: lessonItem ?? this.lessonItem,
      initVideoPlayerFuture: initVideoPlayerFuture ?? this.initVideoPlayerFuture,
      isPlay: isPlay ?? this.isPlay,
    );
  }
}