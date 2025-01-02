import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_app/common/apis/lesson_api.dart';
import 'package:udemy_app/common/entities/entities.dart';
import 'package:udemy_app/pages/course/lesson/bloc/lesson_blocs.dart';
import 'package:udemy_app/pages/course/lesson/bloc/lesson_events.dart';
import 'package:video_player/video_player.dart';

class LessonController {
  final BuildContext context;
  VideoPlayerController? videoPlayerController;

  LessonController({required this.context});

  void init() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    context.read<LessonBlocs>().add(const TriggerPlay(isPlay: false));
    asyncLoadLessonData(args['id']);
  }

  void asyncLoadLessonData(int id) async {
    LessonRequestEntity lessonRequestEntity = LessonRequestEntity(id: id);

    var result = await LessonAPI.lessonDetail(params: lessonRequestEntity);
    debugPrint('lessonDetail result: ${result.data}');

    if (result.statusCode == 200) {
      if (context.mounted) {
        debugPrint('_______context is mounted________');
        context
            .read<LessonBlocs>()
            .add(TriggerLessonVideo(lessonVideoItem: result.data!));

        if (result.data!.video != null) {
          var videoUrl = result.data!.video!;
          Uri url = Uri.parse(videoUrl);
          // This url is important for init video player
          videoPlayerController = VideoPlayerController.networkUrl(url);
          // Here actually stream starts to happen
          var initPlayer = videoPlayerController!.initialize();
          context.read<LessonBlocs>().add(TriggerUrlItem(initVideoPlayerFuture: initPlayer));
        }
      } else {
        debugPrint('_______context is not mounted________');
      }
    } else {
      debugPrint('Failed to get lesson detail');
    }
  }
}
