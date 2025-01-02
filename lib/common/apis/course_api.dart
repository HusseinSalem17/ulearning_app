import 'package:flutter/material.dart';
import 'package:udemy_app/common/apis/checkout_response/checkout_resonse.dart';
import 'package:udemy_app/common/entities/course.dart';
import 'package:udemy_app/common/utils/http_util.dart';

import 'package:dio/dio.dart';
import 'package:udemy_app/pages/course/models/course_entity/course_item.dart';

class CourseAPI {
  static Future<Response<List<CourseItem>>> getCourses() async {
    try {
      final Response<List<CourseItem>> response = await HttpUtil().get(
        '/api/courses/',
        fromJson: (json) =>
            (json as List).map((e) => CourseItem.fromJson(e)).toList(),
      );
      debugPrint('response.data getCourses: ${response.data}');
      debugPrint('status code getCourses: ${response.statusCode}');
      return response;
    } on DioException catch (e) {
      debugPrint('Error getting courses: $e');
      throw Exception('Failed to get courses');
    }
  }

  static Future<Response<CourseItem>> courseDetail(
      {CourseRequestEntity? params}) async {
    try {
      final Response<CourseItem> response = await HttpUtil().get(
        '/api/courses/${params!.id}/',
        fromJson: (json) => CourseItem.fromJson(json),
      );
      debugPrint('response.data courseDetail: ${response.data}');
      debugPrint('status code courseDetail: ${response.statusCode}');
      return response;
    } on DioException catch (e) {
      debugPrint('Error getting courses: $e');
      throw Exception('Failed to get courses');
    }
  }

  static Future<Response<CourseItem>> createCourse(
      Map<String, dynamic> data) async {
    try {
      final Response<CourseItem> response = await HttpUtil().post(
        '/api/courses/',
        data: data,
        fromJson: (json) => CourseItem.fromJson(json),
      );
      debugPrint('response.data: ${response.data}');
      debugPrint('status code: ${response.statusCode}');
      return response;
    } catch (e) {
      debugPrint('Error creating course: $e');
      throw Exception('Failed to create course');
    }
  }

  // Future<CourseEntity> updateCourse(int id, Map<String, dynamic> data) async {
  //   try {
  //     final Response response = await HttpUtil().put(
  //       'api/courses/$id/',
  //       data: data,
  //       fromJson: (json) => CourseEntity.fromJson(json),
  //     );
  //     return CourseEntity.fromJson(response.data);
  //   } catch (e) {
  //     debugPrint('Error updating course: $e');
  //     throw Exception('Failed to update course');
  //   }
  // }

  // Future<void> deleteCourse(int id) async {
  //   try {
  //     await HttpUtil().delete('api/courses/$id/');
  //   } catch (e) {
  //     debugPrint('Error deleting course: $e');
  //     throw Exception('Failed to delete course');
  //   }
  // }

  // For Course Payment
  static Future<Response<CheckoutResponse>> coursePay(
      {CourseRequestEntity? params}) async {
    try {
      debugPrint('coursePay params: ${params!.id}');
      final Response<CheckoutResponse> response = await HttpUtil().post(
        '/api/checkout/create-payment/${params!.id}/',
        fromJson: (json) => CheckoutResponse.fromJson(json),
      );
      debugPrint('response.data coursePay: ${response.data!.toJson()}');
      debugPrint('status code coursePay: ${response.statusCode}');
      return response;
    } on DioException catch (e) {
      debugPrint('Error processing payment: $e');
      throw Exception('Failed to process payment');
    }
  }
}
