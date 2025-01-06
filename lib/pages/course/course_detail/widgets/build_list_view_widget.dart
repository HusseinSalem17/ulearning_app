import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udemy_app/common/values/colors.dart';
import 'package:udemy_app/pages/course/course_detail/bloc/course_detail_states.dart';

Widget courseSummaryView(BuildContext context, CourseDetailStates state) {
  var imagesInfo = <String, String>{
    "${state.courseItem!.videosLength ?? "0"} Hours Video": "video_detail.png",
    "Total ${state.courseItem!.lessonNum ?? "0"} Lessons": "file_detail.png",
    "76 Downloadable Resources": "download_detail.png",
  };
  return Column(
    children: [
      ...List.generate(
        imagesInfo.length,
        (index) => GestureDetector(
          onTap: null,
          child: Container(
            margin: EdgeInsets.only(top: 15.h),
            child: Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  // padding: EdgeInsets.all(8.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: AppColors.primaryElement,
                  ),
                  child: Image.asset(
                    width: 30.w,
                    height: 30.h,
                    "assets/icons/${imagesInfo.values.elementAt(index)}",
                  ),
                ),
                SizedBox(
                  width: 16.w,
                ),
                Text(
                  imagesInfo.keys.elementAt(index),
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primarySecondaryElementText,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
