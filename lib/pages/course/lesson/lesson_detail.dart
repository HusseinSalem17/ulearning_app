import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udemy_app/common/values/colors.dart';
import 'package:udemy_app/common/widgets/build_app_bar_reusable.dart';
import 'package:udemy_app/constants.dart';
import 'package:udemy_app/pages/course/lesson/bloc/lesson_blocs.dart';
import 'package:udemy_app/pages/course/lesson/bloc/lesson_events.dart';
import 'package:udemy_app/pages/course/lesson/bloc/lesson_states.dart';
import 'package:udemy_app/pages/course/lesson/lesson_controller.dart';
import 'package:video_player/video_player.dart';

class LessonDetail extends StatefulWidget {
  const LessonDetail({super.key});

  @override
  State<LessonDetail> createState() => _LessonDetailState();
}

class _LessonDetailState extends State<LessonDetail> {
  late LessonController _lessonController;
  int videoIndex = 0;

  @override
  void didChangeDependencies() {
    _lessonController = LessonController(context: context);
    context.read<LessonBlocs>().add(
          const TriggerUrlItem(
            initVideoPlayerFuture: null,
          ),
        );
    _lessonController.init();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
    _lessonController.videoPlayerController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessonBlocs, LessonStates>(
      builder: (context, state) {
        return SafeArea(
          child: Container(
            color: Colors.white,
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: buildAppBarReusable('Lesson Detail'),
              body: CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: EdgeInsets.symmetric(
                      vertical: 20.h,
                      horizontal: 25.w,
                    ),
                    sliver: SliverToBoxAdapter(
                      child: Column(
                        children: [
                          // Video Preview
                          Container(
                            width: 325.w,
                            height: 200.h,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                fit: BoxFit.fitWidth,
                                image: AssetImage(
                                  AssetsHelper.IC_VIDEO,
                                ),
                              ),
                              borderRadius: BorderRadius.circular(
                                20.h,
                              ),
                            ),
                            child: FutureBuilder(
                              future: state.initVideoPlayerFuture,
                              builder: (context, snapshot) {
                                // Check if the connection is made to the certain video on the server
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  return _lessonController
                                              .videoPlayerController ==
                                          null
                                      ? Container()
                                      : AspectRatio(
                                          aspectRatio: _lessonController
                                              .videoPlayerController!
                                              .value
                                              .aspectRatio,
                                          child: Stack(
                                            alignment: Alignment.bottomCenter,
                                            children: <Widget>[
                                              VideoPlayer(
                                                _lessonController
                                                    .videoPlayerController!,
                                              ),
                                              VideoProgressIndicator(
                                                _lessonController
                                                    .videoPlayerController!,
                                                allowScrubbing: true,
                                                colors:
                                                    const VideoProgressColors(
                                                  playedColor:
                                                      AppColors.primaryElement,
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                } else {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              },
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    // if it's already playing, pause it
                                    if (state.isPlay) {
                                      _lessonController.videoPlayerController!
                                          .pause();
                                      context.read<LessonBlocs>().add(
                                          const TriggerPlay(isPlay: false));
                                    } else {
                                      // if it's not playing, play it
                                      _lessonController.videoPlayerController!
                                          .play();
                                      context
                                          .read<LessonBlocs>()
                                          .add(const TriggerPlay(isPlay: true));
                                    }
                                  },
                                  child: state.isPlay
                                      ? const Icon(
                                          Icons.pause,
                                          size: 24,
                                        )
                                      : const Icon(
                                          Icons.play_arrow,
                                          size: 24,
                                        ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }


}
//todo: study slivers and how it works