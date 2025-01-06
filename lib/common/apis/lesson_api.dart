import 'package:flutter/material.dart';
import 'package:udemy_app/common/entities/entities.dart';
import 'package:udemy_app/common/utils/http_util.dart';

import 'package:dio/dio.dart';
import 'package:udemy_app/pages/course/models/course_entity/lesson_detail.dart';

class LessonAPI {
  static Future<Response<List<LessonDetailModel>>> lessonList({
    LessonRequestEntity? params,
  }) async {
    try {
      final Response<List<LessonDetailModel>> response = await HttpUtil().get(
        '/api/lessonList/${params!.id}/',
        fromJson: (json) =>
            (json as List).map((e) => LessonDetailModel.fromJson(e)).toList(),
      );
      debugPrint('response.data lessonList: ${response.data}');
      debugPrint('status code lessonList: ${response.statusCode}');
      return response;
    } on DioException catch (e) {
      debugPrint('Error getting courses: $e');
      throw Exception('Failed to get courses');
    }
  }

  static Future<Response<LessonDetailModel>> lessonDetail(
      {LessonRequestEntity? params}) async {
    try {
      final Response<LessonDetailModel> response = await HttpUtil().get(
        '/api/lesson/${params!.id}/',
        fromJson: (json) => LessonDetailModel.fromJson(json),
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
