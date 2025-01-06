import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udemy_app/common/values/colors.dart';
import 'package:udemy_app/common/widgets/reusable_text.dart';
import 'package:udemy_app/common/values/assest_helper.dart';
import 'package:udemy_app/pages/course/models/course_entity/course_item.dart';

Widget menuView(CourseItem courseItem) {
  return SizedBox(
    width: 325.w,
    child: Row(
      children: [
        GestureDetector(
          onTap: () {
            debugPrint('Menu 1');
          },
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 15.w,
              vertical: 5.h,
            ),
            decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.circular(7.r),
              border: Border.all(
                color: AppColors.primaryElement,
              ),
            ),
            child: reusableText(
              'Author Page',
              color: AppColors.primaryElementText,
              fontWeight: FontWeight.normal,
              fontSize: 10.sp,
            ),
          ),
        ),
        _iconAndNum(AssetsHelper.IC_PEOPLE, courseItem.follow ?? 0),
        _iconAndNum(AssetsHelper.IC_STAR, courseItem.score?.toInt() ?? 0),
      ],
    ),
  );
}

Widget _iconAndNum(String iconPath, int num) {
  return Container(
    margin: EdgeInsets.only(left: 30.w),
    child: Row(
      children: [
        Image(
          image: AssetImage(iconPath),
          width: 20.w,
          height: 20.h,
        ),
        reusableText(
          num.toString(),
          color: AppColors.primaryThirdElementText,
          fontSize: 11.sp,
          fontWeight: FontWeight.normal,
        ),
      ],
    ),
  );
}
