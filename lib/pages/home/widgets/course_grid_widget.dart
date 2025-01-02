//for coruse grid view ui
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udemy_app/common/values/colors.dart';
import 'package:udemy_app/common/values/constant.dart';
import 'package:udemy_app/constants.dart';
import 'package:udemy_app/pages/course/models/course_entity/course_item.dart';

Widget courseGrid(CourseItem item) {
  return Container(
    padding: EdgeInsets.all(12.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.w),
      image: DecorationImage(
        image: item.thumbnail != null
            ? NetworkImage(AppConstants.SERVER_API_URL + item.thumbnail!)
            : const AssetImage(
                AssetsHelper.IC_IMAGE_1,
              ) as ImageProvider,
        fit: BoxFit.fill,
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          item.name ?? "",
          maxLines: 1,
          textAlign: TextAlign.left,
          overflow: TextOverflow.clip,
          softWrap: false,
          style: TextStyle(
            color: AppColors.primaryElementText,
            fontWeight: FontWeight.bold,
            fontSize: 11.sp,
          ),
        ),
        SizedBox(
          height: 4.h,
        ),
        Text(
          item.description ?? "",
          maxLines: 1,
          textAlign: TextAlign.left,
          overflow: TextOverflow.clip,
          softWrap: false,
          style: TextStyle(
            color: AppColors.primaryFourthElementText,
            fontWeight: FontWeight.normal,
            fontSize: 8.sp,
          ),
        )
      ],
    ),
  );
}
