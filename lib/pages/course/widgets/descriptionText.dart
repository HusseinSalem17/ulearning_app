import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udemy_app/common/values/colors.dart';
import 'package:udemy_app/common/widgets/reusable_text.dart';

Widget descriptionText(String description) {
  return reusableText(
    description,
    color: AppColors.primaryThirdElementText,
    fontWeight: FontWeight.normal,
    textAlign: TextAlign.justify,
    fontSize: 11.sp,
  );
}
