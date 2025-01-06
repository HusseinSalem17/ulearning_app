import 'package:udemy_app/pages/course/models/course_entity/lesson_detail.dart';
import 'package:equatable/equatable.dart';

// Equatable helps to compare objects
class LessonStates extends Equatable {
  final LessonDetailModel? lessonItem;
  final Future<void>? initVideoPlayerFuture;
  final bool isPlay;
  final int videoIndex;

  const LessonStates({
    this.lessonItem,
    this.isPlay = false,
    this.initVideoPlayerFuture,
    this.videoIndex = 0,
  });

  LessonStates copyWith({
    LessonDetailModel? lessonItem,
    Future<void>? initVideoPlayerFuture,
    bool? isPlay,
    int? videoIndex,
  }) {
    return LessonStates(
      lessonItem: lessonItem ?? this.lessonItem,
      initVideoPlayerFuture:
          initVideoPlayerFuture ?? this.initVideoPlayerFuture,
      isPlay: isPlay ?? this.isPlay,
      videoIndex: videoIndex ?? this.videoIndex,
    );
  }

  @override
  List<Object?> get props =>
      [lessonItem, initVideoPlayerFuture, isPlay, videoIndex];
}
