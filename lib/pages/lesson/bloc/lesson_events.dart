import 'package:equatable/equatable.dart';
import 'package:udemy_app/pages/course/models/course_entity/lesson_detail.dart';

abstract class LessonEvents extends Equatable {
  const LessonEvents();

  @override
  List<Object?> get props => [];
}

// class TriggerLessonVideo extends LessonEvents {
//   final String videoUrl;
//   TriggerLessonVideo({required this.videoUrl});
// }

class TriggerOtherLessons extends LessonEvents {
  final List<LessonDetailModel> otherLessons;

  const TriggerOtherLessons({required this.otherLessons});

  @override
  List<Object?> get props => [otherLessons];
}

class TriggerLessonVideo extends LessonEvents {
  final LessonDetailModel lessonVideoItem;
  const TriggerLessonVideo({required this.lessonVideoItem});
  @override
  List<Object?> get props => [lessonVideoItem];
}

class TriggerUrlItem extends LessonEvents {
  final Future<void>? initVideoPlayerFuture;
  const TriggerUrlItem({this.initVideoPlayerFuture});
  @override
  List<Object?> get props => [initVideoPlayerFuture];
}

class TriggerPlay extends LessonEvents {
  final bool isPlay;
  const TriggerPlay({required this.isPlay});
  @override
  List<Object?> get props => [isPlay];
}

class TriggerVideoIndex extends LessonEvents {
  final int videoIndex;
  const TriggerVideoIndex({required this.videoIndex});
  @override
  List<Object?> get props => [videoIndex];
}
