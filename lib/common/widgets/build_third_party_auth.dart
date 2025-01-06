// We need context for accessing bloc
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udemy_app/common/values/assest_helper.dart';

Widget buildThiredPartyAuth(BuildContext context) {
  return Center(
    child: Container(
      margin: EdgeInsets.only(
        top: 40.h,
        bottom: 20.h,
      ),
      padding: EdgeInsets.only(
        left: 50.h,
        right: 50.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _reusableIcons(iconName: AssetsHelper.IC_GOOGLE),
          _reusableIcons(iconName: AssetsHelper.IC_APPLE),
          _reusableIcons(iconName: AssetsHelper.IC_FACEBOOK),
        ],
      ),
    ),
  );
}

Widget _reusableIcons({required String iconName}) {
  return GestureDetector(
    onTap: () {},
    child: SizedBox(
      width: 40.w,
      height: 40.h,
      child: Image.asset(iconName),
    ),
  );
}
