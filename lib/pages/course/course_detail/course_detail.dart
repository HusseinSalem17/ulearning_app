import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udemy_app/common/widgets/reusable_text.dart';
import 'package:udemy_app/pages/course/course_detail/bloc/course_detail_blocs.dart';
import 'package:udemy_app/pages/course/course_detail/bloc/course_detail_states.dart';
import 'package:udemy_app/pages/course/course_detail/course_detail_controller.dart';
import 'package:udemy_app/common/widgets/build_app_bar_reusable.dart';
import 'package:udemy_app/pages/course/widgets/build_list_view_widget.dart';
import 'package:udemy_app/pages/course/widgets/course_summary.dart';
import 'package:udemy_app/pages/course/widgets/descriptionText.dart';
import 'package:udemy_app/pages/course/widgets/go_buy_button_widet.dart';
import 'package:udemy_app/pages/course/widgets/menu_view_widget.dart';
import 'package:udemy_app/pages/course/widgets/thumbnail_widget.dart';

import '../widgets/course_lesson_list_widget.dart';

class CourseDetail extends StatefulWidget {
  const CourseDetail({super.key});

  @override
  State<CourseDetail> createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  late CourseDetailController _courseDetailController;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Get the arguments from the ModalRoute (from home_page.dart)
    _courseDetailController = CourseDetailController(context);
    _courseDetailController.init();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseDetailBloc, CourseDetailStates>(
      builder: (context, state) {
        debugPrint('CourseDetailBloc state: ${state.courseItem.toString()}');
        return state.courseItem == null
            ? const Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.blue,
                ),
              )
            : Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: SafeArea(
                  child: Scaffold(
                    backgroundColor: Colors.white,
                    appBar: buildAppBarReusable('Course Detail'),
                    body: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 15.h,
                              horizontal: 25.w,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                // First big image
                                thumbNail(
                                  state.courseItem?.thumbnail.toString(),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                // Three buttons for menus
                                menuView(),
                                SizedBox(
                                  height: 15.h,
                                ),
                                // Course Description
                                reusableText('Course Description'),
                                SizedBox(
                                  height: 15.h,
                                ),
                                // Course Buy Button
                                descriptionText(
                                  state.courseItem!.description.toString(),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    await _courseDetailController.goBuy(
                                      state.courseItem!.id,
                                    );
                                  },
                                  child: goBuyButton('Go Buy'),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                // Course Summary Title
                                courseSummaryTitle(
                                    state.courseItem!.name.toString()),
                                // Course Summary List
                                courseSummaryView(context, state),
                                SizedBox(
                                  height: 20.h,
                                ),
                                // Lesson List Title
                                reusableText('Lesson List'),
                                SizedBox(
                                  height: 20.h,
                                ),
                                // Course Lesson List
                                courseLessonList(state),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
      },
    );
  }
}
