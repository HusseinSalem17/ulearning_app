import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udemy_app/common/widgets/reusable_text.dart';

Widget courseSummaryTitle(String title) {
  return reusableText(
    title,
    fontSize: 16.sp,
  );
}
