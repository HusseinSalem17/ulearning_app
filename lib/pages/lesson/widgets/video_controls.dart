import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udemy_app/common/values/assest_helper.dart';
import 'package:udemy_app/common/widgets/toast_info.dart';
import 'package:udemy_app/pages/course/models/course_entity/course_item.dart';
import 'package:udemy_app/pages/lesson/bloc/lesson_blocs.dart';
import 'package:udemy_app/pages/lesson/bloc/lesson_events.dart';
import 'package:udemy_app/pages/lesson/bloc/lesson_states.dart';
import 'package:udemy_app/pages/lesson/lesson_controller.dart';

Widget videoControls(
  LessonStates state,
  LessonController lessonController,
  CourseItem courseItem,
  BuildContext context,
) {
  return Container(
    margin: EdgeInsets.only(
      top: 15.h,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Left Button
        GestureDetector(
          onTap: () {
            var videoIndex = context.read<LessonBlocs>().state.videoIndex;
            videoIndex = videoIndex - 1;
            if (videoIndex < 0) {
              videoIndex = 0;
              toastInfo(msg: "This is the first video");
            } else {
              var videoItem = courseItem.lessons![videoIndex];
              lessonController.playVido(Uri.parse(videoItem.video!));
            }
            context
                .read<LessonBlocs>()
                .add(TriggerVideoIndex(videoIndex: videoIndex));
          },
          child: Container(
            width: 24.w,
            height: 24.h,
            margin: EdgeInsets.only(
              right: 15.w,
            ),
            child: Image.asset(
              AssetsHelper.IC_REWIND_LEFT,
              width: 24.w,
              height: 24.h,
            ),
          ),
        ),
        // Play and Pause Button
        GestureDetector(
          onTap: () {
            // if it's already playing, pause it
            if (state.isPlay) {
              lessonController.videoPlayerController!.pause();
              context.read<LessonBlocs>().add(const TriggerPlay(isPlay: false));
            } else {
              // if it's not playing, play it
              lessonController.videoPlayerController!.play();
              context.read<LessonBlocs>().add(const TriggerPlay(isPlay: true));
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
        // Right Button
        GestureDetector(
          onTap: () {
            var videoIndex = context.read<LessonBlocs>().state.videoIndex;
            videoIndex = videoIndex + 1;
            if (videoIndex >= courseItem.lessons!.length) {
              // otherwise, it will be out of index
              videoIndex = videoIndex - 1;
              toastInfo(msg: "This is the last video");
            } else {
              var videoItem = courseItem.lessons![videoIndex];
              lessonController.playVido(Uri.parse(videoItem.video!));
            }
            context
                .read<LessonBlocs>()
                .add(TriggerVideoIndex(videoIndex: videoIndex));
          },
          child: Container(
            width: 24.w,
            height: 24.h,
            margin: EdgeInsets.only(
              left: 15.w,
            ),
            child: Image.asset(
              AssetsHelper.IC_REWIND_RIGHT,
              width: 24.w,
              height: 24.h,
            ),
          ),
        ),
      ],
    ),
  );

}

