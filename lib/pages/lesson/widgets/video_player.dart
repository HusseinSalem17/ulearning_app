import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udemy_app/common/values/colors.dart';
import 'package:udemy_app/pages/lesson/bloc/lesson_states.dart';
import 'package:udemy_app/pages/lesson/lesson_controller.dart';
import 'package:video_player/video_player.dart';

Widget videoPlayer(LessonStates state, LessonController lessonController) {
  return state.lessonItem == null
      ? SizedBox(
          height: 200.h,
          child: const Center(
            child: CircularProgressIndicator(
              valueColor:
                  AlwaysStoppedAnimation<Color>(AppColors.primaryElement),
            ),
          ),
        )
      : Container(
          width: 325.w,
          height: 200.h,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fitWidth,
              image: NetworkImage(
                state.lessonItem!.thumbnail!,
              ),
            ),
            borderRadius: BorderRadius.circular(
              0.h,
            ),
          ),
          child: FutureBuilder(
            future: state.initVideoPlayerFuture,
            builder: (context, snapshot) {
              // Check if the connection is made to the certain video on the server
              if (snapshot.connectionState == ConnectionState.done) {
                return lessonController.videoPlayerController == null
                    ? Container()
                    : AspectRatio(
                        aspectRatio: lessonController
                            .videoPlayerController!.value.aspectRatio,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: <Widget>[
                            VideoPlayer(
                              lessonController.videoPlayerController!,
                            ),
                            VideoProgressIndicator(
                              lessonController.videoPlayerController!,
                              allowScrubbing: true,
                              colors: const VideoProgressColors(
                                playedColor: AppColors.primaryElement,
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
        );
}
