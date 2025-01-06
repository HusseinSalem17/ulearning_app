import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udemy_app/common/routes/names.dart';
import 'package:udemy_app/common/values/colors.dart';
import 'package:udemy_app/common/values/assest_helper.dart';
import 'package:udemy_app/pages/course/models/course_entity/course_item.dart';
import 'package:udemy_app/pages/course/course_detail/widgets/List_Text_item_widget.dart';

Widget courseLessonList(CourseItem courseItem) {
  return SingleChildScrollView(
    child: ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: courseItem.lessons!.length,
      itemBuilder: (context, index) {
        debugPrint(
            'CourseLessonListWidget: my image path: ${courseItem.lessons![index].thumbnail}');
        return Container(
          margin: EdgeInsets.only(
            top: 10.h,
          ),
          width: 325.w,
          height: 80.h,
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
            vertical: 10.h,
          ),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(255, 255, 255, 1),
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 3,
                offset: const Offset(0, 1),
              )
            ],
          ),
          // TODO: add checkBuy in details of the course if the user has bought the course
          child: InkWell(
            onTap: () {
              debugPrint(
                  'lesson data course_lesson_list_widget: ${courseItem.lessons![index]}');
              Navigator.of(context).pushNamed(
                AppRoutes.LESSON_DETAIL,
                arguments: {
                  'id': courseItem.lessons![index].id,
                },
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // for image and the text
                Row(
                  children: [
                    Container(
                      width: 60.w,
                      height: 60.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        image: DecorationImage(
                          fit: BoxFit.fitHeight,
                          image: courseItem.lessons![index].thumbnail == null
                              ? const AssetImage(AssetsHelper.IC_IMAGE_1)
                              : NetworkImage(
                                  courseItem.lessons![index].thumbnail!,
                                ) as ImageProvider<Object>,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // List Item Title
                        listContainer(
                          name: courseItem.lessons![index].title!,
                        ),
                        // List Item Description
                        listContainer(
                          name: courseItem.lessons![index].description ?? '',
                          fontSize: 10,
                          color: AppColors.primaryThirdElementText,
                          fontWeight: FontWeight.normal,
                        ),
                      ],
                    )
                  ],
                ),
                // for the right arrow
                Image(
                  height: 24.h,
                  width: 24.w,
                  image: const AssetImage(AssetsHelper.IC_ARROW_RIGHT),
                )
              ],
            ),
          ),
        );
      },
    ),
  );
}
