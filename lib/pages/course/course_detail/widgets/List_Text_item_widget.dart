import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udemy_app/common/values/colors.dart';

Widget listContainer({
  double fontSize = 13,
  Color color = AppColors.primaryText,
  FontWeight fontWeight = FontWeight.bold,
  String name = 'UI Design',
}) {
  return Container(
    width: 200.w,
    margin: EdgeInsets.only(left: 6.w),
    child: Text(
      name,
      // TextOverflow.clip will show the text as it is
      overflow: TextOverflow.clip,
      maxLines: 1,
      style: TextStyle(
        fontSize: fontSize.sp,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    ),
  );
}
