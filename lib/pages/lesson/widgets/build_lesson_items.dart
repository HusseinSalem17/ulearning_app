import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udemy_app/common/values/assest_helper.dart';
import 'package:udemy_app/common/widgets/reusable_text.dart';
import 'package:udemy_app/pages/course/models/course_entity/lesson_detail.dart';
import 'package:udemy_app/pages/lesson/bloc/lesson_blocs.dart';
import 'package:udemy_app/pages/lesson/bloc/lesson_events.dart';
import 'package:udemy_app/pages/lesson/lesson_controller.dart';

Widget buildLessonItems({
  required BuildContext context,
  required LessonDetailModel lessonItem,
  required int index,
  required LessonController lessonController,
}) {
  return Container(
    width: 325.w,
    height: 80.h,
    margin: EdgeInsets.only(
      bottom: 20.h,
    ),
    padding: EdgeInsets.symmetric(
      horizontal: 10.w,
      vertical: 10.h,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(
        10.h,
      ),
      color: const Color.fromRGBO(255, 255, 255, 1),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          offset: const Offset(0, 1),
          blurRadius: 3,
          spreadRadius: 2,
        ),
      ],
    ),
    child: InkWell(
      onTap: () {
        context.read<LessonBlocs>().add(
              TriggerVideoIndex(
                videoIndex: index,
              ),
            );
        lessonController.playVido(Uri.parse(lessonItem.video!));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 60.w,
                height: 60.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    15.w,
                  ),
                  image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: NetworkImage(
                      lessonItem.thumbnail!,
                    ),
                  ),
                ),
              ),
              Container(
                width: 210.w,
                height: 60.h,
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(
                  left: 6.w,
                ),
                child: reusableText(
                  lessonItem.title!,
                  fontSize: 13.sp,
                ),
              ),
            ],
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  context.read<LessonBlocs>().add(
                        TriggerVideoIndex(
                          videoIndex: index,
                        ),
                      );
                  lessonController.playVido(Uri.parse(lessonItem.video!));
                },
                child: Image.asset(
                  AssetsHelper.IC_PLAY_CIRCLE,
                  width: 24.w,
                  height: 24.h,
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}
