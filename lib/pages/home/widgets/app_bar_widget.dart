import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udemy_app/common/values/constant_api.dart';
import '../../../common/values/assest_helper.dart';

AppBar buildAppBarHome(String avatar) {
  debugPrint('avatar: $avatar');
  debugPrint('SERVER_API_URL: ${AppConstants.SERVER_API_URL_WEB}');
  debugPrint(
    'AppConstants.SERVER_API_URL + avatar: ${AppConstants.SERVER_API_URL + avatar}',
  );
  return AppBar(
    centerTitle: true,
    title: Container(
      margin: EdgeInsets.only(top: 10.h, left: 7.w, right: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 14.w,
            height: 14.h,
            child: Image.asset(
              AssetsHelper.IC_MENU,
            ),
          ),
          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(top: 4.h),
              width: 32.w,
              height: 32.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                image: DecorationImage(
                  image: NetworkImage(avatar),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}
