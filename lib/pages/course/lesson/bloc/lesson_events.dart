import 'package:udemy_app/pages/course/models/course_entity/lesson_detail.dart';

abstract class LessonEvents {
  const LessonEvents();
}

// class TriggerLessonVideo extends LessonEvents {
//   final String videoUrl;
//   TriggerLessonVideo({required this.videoUrl});
// }

class TriggerLessonVideo extends LessonEvents {
  //Todo: change to final List<LessonDetail> lessonVideoItem; after updating the backend
  final LessonDetail lessonVideoItem;
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
