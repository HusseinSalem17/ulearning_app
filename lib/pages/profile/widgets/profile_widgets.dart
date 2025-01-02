import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udemy_app/common/routes/names.dart';

import '../../../common/values/colors.dart';
import '../../../common/widgets/reusable_text.dart';
import '../../../constants.dart';

AppBar buildAppbar() {
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 18.w,
          height: 12.h,
          child: Image.asset(
            AssetsHelper.IC_MENU,
          ),
        ),
        reusableText("Profile"),
        SizedBox(
          width: 24.w,
          height: 24.h,
          child: Image.asset(
            AssetsHelper.IC_MORE_VERTICAL,
          ),
        ),
      ],
    ),
  );
}

//profile icon and edit button
Widget profileIconAndEditButton() {
  return Container(
    width: 80.w,
    height: 80.h,
    alignment: AlignmentDirectional.bottomEnd,
    padding: EdgeInsets.only(right: 6.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.r),
      image: const DecorationImage(
        image: AssetImage(
          AssetsHelper.IC_HEAD_PIC,
        ),
      ),
    ),
    child: Image(
      width: 25.w,
      height: 25.w,
      image: const AssetImage(
        AssetsHelper.IC_EDIT_3,
      ),
    ),
  );
}

//settings sections buttons
var imagesInfo = <String, String>{
  "Settings": AssetsHelper.IC_SETTINGS,
  "Payment details": AssetsHelper.IC_CREDIT_CARD,
  "Achievement": AssetsHelper.IC_AWARD,
  "Love": AssetsHelper.IC_LOVE,
  "Learning Reminders": AssetsHelper.IC_LEARNING_REMIDERS,
};

Widget buildListView(BuildContext context) {
  return Column(
    children: [
      ...List.generate(
        imagesInfo.length,
        (index) => GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(AppRoutes.SETTINGS);
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 15.h),
            child: Row(
              children: [
                Container(
                  width: 40.w,
                  height: 40.h,
                  padding: EdgeInsets.all(8.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: AppColors.primaryElement,
                  ),
                  child: Image.asset(
                    imagesInfo.values.elementAt(index),
                  ),
                ),
                SizedBox(
                  width: 16.w,
                ),
                Text(
                  imagesInfo.keys.elementAt(index),
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryText,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
