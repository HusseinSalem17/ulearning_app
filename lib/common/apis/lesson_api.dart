import 'package:flutter/material.dart';
import 'package:udemy_app/common/entities/entities.dart';
import 'package:udemy_app/common/utils/http_util.dart';

import 'package:dio/dio.dart';
import 'package:udemy_app/pages/course/models/course_entity/lesson_detail.dart';

class LessonAPI {
  static Future<Response<List<LessonDetail>>> lessonList({
    LessonRequestEntity? params,
  }) async {
    try {
      final Response<List<LessonDetail>> response = await HttpUtil().get(
        '/api/lessonList/${params!.id}/',
        fromJson: (json) =>
            (json as List).map((e) => LessonDetail.fromJson(e)).toList(),
      );
      debugPrint('response.data lessonList: ${response.data}');
      debugPrint('status code lessonList: ${response.statusCode}');
      return response;
    } on DioException catch (e) {
      debugPrint('Error getting courses: $e');
      throw Exception('Failed to get courses');
    }
  }

  static Future<Response<LessonDetail>> lessonDetail(
      {LessonRequestEntity? params}) async {
    try {
      final Response<LessonDetail> response = await HttpUtil().get(
        '/api//lesson/${params!.id}/',
        fromJson: (json) => LessonDetail.fromJson(json),
      );
      debugPrint('response.data courseDetail: ${response.data}');
      debugPrint('status code courseDetail: ${response.statusCode}');
      return response;
    } on DioException catch (e) {
      debugPrint('Error getting courses: $e');
      throw Exception('Failed to get courses');
    }
  }
}
