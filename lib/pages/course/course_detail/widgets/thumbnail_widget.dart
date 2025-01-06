import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udemy_app/common/values/assest_helper.dart';

Container thumbNail(String? thumbnail) {
  debugPrint('thumbnail hereeee: $thumbnail');
  return Container(
    width: 325.w,
    height: 200.h,
    decoration: BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.fitWidth,
        image: thumbnail != null
            ? NetworkImage(thumbnail)
            : const AssetImage(
                AssetsHelper.IC_IMAGE_1,
              ) as ImageProvider,
      ),
    ),
  );
}
