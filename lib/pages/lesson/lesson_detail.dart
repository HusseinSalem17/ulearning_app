import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udemy_app/common/widgets/build_app_bar_reusable.dart';
import 'package:udemy_app/pages/course/course_detail/bloc/course_detail_blocs.dart';
import 'package:udemy_app/pages/lesson/bloc/lesson_blocs.dart';
import 'package:udemy_app/pages/lesson/bloc/lesson_events.dart';
import 'package:udemy_app/pages/lesson/bloc/lesson_states.dart';
import 'package:udemy_app/pages/lesson/lesson_controller.dart';
import 'package:udemy_app/pages/course/models/course_entity/course_item.dart';
import 'package:udemy_app/pages/lesson/widgets/build_lesson_items.dart';
import 'package:udemy_app/pages/lesson/widgets/video_controls.dart';
import 'package:udemy_app/pages/lesson/widgets/video_player.dart';

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
    context.read<LessonBlocs>().add(
          const TriggerVideoIndex(
            videoIndex: 0,
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
        CourseItem courseItem =
            context.read<CourseDetailBloc>().state.courseItem!;
        debugPrint('my courseItem: $courseItem');
        debugPrint('lessonItem state: ${state.lessonItem}');
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
                          videoPlayer(state, _lessonController),
                          // Video Control
                          videoControls(
                            state,
                            _lessonController,
                            courseItem,
                            context,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.symmetric(
                      vertical: 18.h,
                      horizontal: 25.w,
                    ),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                          childCount: courseItem.lessons!.length,
                          (context, index) {
                        return buildLessonItems(
                          context: context,
                          lessonItem: courseItem.lessons![index],
                          index: index,
                          lessonController: _lessonController,
                        );
                      }),
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

