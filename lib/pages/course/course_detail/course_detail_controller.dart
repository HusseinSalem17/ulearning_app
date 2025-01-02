import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:udemy_app/common/apis/checkout_response/checkout_resonse.dart';
import 'package:udemy_app/common/apis/course_api.dart';
import 'package:udemy_app/common/apis/lesson_api.dart';
import 'package:udemy_app/common/entities/course.dart';
import 'package:udemy_app/common/entities/entities.dart';
import 'package:udemy_app/common/widgets/toast_info.dart';
import 'package:udemy_app/pages/course/course_detail/bloc/course_detail_blocs.dart';
import 'package:udemy_app/pages/course/course_detail/bloc/course_detail_events.dart';

import '../../../common/routes/names.dart';

class CourseDetailController {
  final BuildContext context;
  CourseDetailController(this.context);

  void init() async {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    asyncLoadCourseData(args['id']);
    asyncLoadLessonData(args['id']);
  }

  void asyncLoadCourseData(int? id) async {
    CourseRequestEntity courseRequestEntity = CourseRequestEntity(id: id);
    try {
      var result = await CourseAPI.courseDetail(params: courseRequestEntity);
      debugPrint('courseDetail result: ${result.data}');
      if (result.statusCode == 200) {
        if (context.mounted) {
          debugPrint('_______context is mounted________');
          context
              .read<CourseDetailBloc>()
              .add(TriggerCourseDetail(courseItem: result.data!));
        } else {
          debugPrint('_______context is not mounted________');
        }
      } else {
        toastInfo(msg: 'Failed to get course detail');
      }
    } catch (e) {
      toastInfo(msg: 'An error occurred: $e');
      debugPrint('asyncLoadAllData error: ${e.toString()}');
    }
  }

  // Just for test (don't need it i get them in asyncLoadCourseData)
  void asyncLoadLessonData(int? id) async {
    LessonRequestEntity lessonRequestEntity = LessonRequestEntity(id: id);
    try {
      var result = await LessonAPI.lessonList(params: lessonRequestEntity);
      debugPrint('lessonList result: ${result.data}');

      if (result.statusCode == 200) {
        if (context.mounted) {
          debugPrint('_______context is mounted________');
          context
              .read<CourseDetailBloc>()
              .add(TriggerLessonList(lessonItem: result.data!));
        } else {
          debugPrint('_______context is not mounted________');
        }
      } else {
        toastInfo(msg: 'Failed to get lesson list');
      }
    } catch (e) {
      toastInfo(msg: 'An error occurred: $e');
      debugPrint('asyncLoadAllData error: ${e.toString()}');
    }
  }

  Future<void> goBuy(int? id) async {
    debugPrint('goBuy id: $id');
    EasyLoading.show(
      indicator: const CircularProgressIndicator(),
      maskType: EasyLoadingMaskType.clear,
      dismissOnTap: false,
    );

    try {
      CourseRequestEntity courseRequestEntity = CourseRequestEntity(id: id);
      Response<CheckoutResponse> result =
          await CourseAPI.coursePay(params: courseRequestEntity);
      if (result.statusCode == 200 || result.statusCode == 201) {
        // cleaner format of the url
        debugPrint('----my url hereee: ${result.data!.data!.url}');
        debugPrint('---- data hereee: ${result.data!.data!.toJson()}');
        var url = Uri.decodeFull(result.data!.data!.url!);
        if (context.mounted) {
          var res = await Navigator.of(context).pushNamed(
            AppRoutes.PAY_WEB_VIEW,
            arguments: {
              "url": url,
            },
          );
          // got this message from the webview (form the backend)
          if (res == "success") {
            toastInfo(msg: result.data!.detail!);
          }
          debugPrint('----my url hereee: $url');
          toastInfo(msg: 'Payment successful');
        } else {
          debugPrint('Context is not mounted');
        }
      } else if (result.statusCode == 400 &&
          result.data!.detail == "Order already paid") {
        toastInfo(msg: 'Order already paid');
      } else {
        debugPrint('----my error hereee: ${result.data!.detail}');
        toastInfo(msg: 'Payment failed');
      }
    } catch (e) {
      toastInfo(msg: 'An error occurred: $e');
      debugPrint('goBuy error: ${e.toString()}');
    } finally {
      EasyLoading.dismiss();
    }
  }
}
