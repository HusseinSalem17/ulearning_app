//menu view for showing items
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udemy_app/common/values/colors.dart';
import 'package:udemy_app/common/widgets/reusable_text.dart';

Widget menuViews() {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(top: 16.h),
        width: 325.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            reusableText("Choose your course"),
            GestureDetector(
              child: reusableText(
                "See all",
                color: AppColors.primaryThirdElementText,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
      Container(
          margin: EdgeInsets.only(top: 20.h),
          child: Row(
            children: [
              _resuableMenuText("All"),
              _resuableMenuText(
                "Popular",
                textColor: AppColors.primaryThirdElementText,
                backgroundColor: Colors.white,
              ),
              _resuableMenuText(
                "Newest",
                textColor: AppColors.primaryThirdElementText,
                backgroundColor: Colors.white,
              ),
            ],
          ))
    ],
  );
}

//for the menu buttons, resuable text
Widget _resuableMenuText(
  String menuText, {
  Color textColor = AppColors.primaryElementText,
  Color backgroundColor = AppColors.primaryElement,
}) {
  return Container(
    margin: EdgeInsets.only(right: 16.w),
    padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 8.h, bottom: 8.h),
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(8.r),
      border: Border.all(
        color: backgroundColor,
      ),
    ),
    child: reusableText(
      menuText,
      color: textColor,
      fontWeight: FontWeight.normal,
      fontSize: 11,
    ),
  );
}
