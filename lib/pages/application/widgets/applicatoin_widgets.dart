import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udemy_app/pages/home/home_page.dart';
import 'package:udemy_app/pages/profile/profile_page.dart';

import '../../../common/values/colors.dart';
import '../../../constants.dart';

Widget buildPage(int index) {
  List<Widget> _widget = [
    const HomePage(),
    Center(
      child: Text(
        "Search",
      ),
    ),
    Center(
      child: Text(
        "Course",
      ),
    ),
    Center(
      child: Text(
        "Chat",
      ),
    ),
    const ProfilePage(),
  ];

  return _widget[index];
}

var bottomTabs = [
  BottomNavigationBarItem(
    label: "Home",
    activeIcon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset(
        AssetsHelper.IC_HOME,
        color: AppColors.primaryElement,
      ),
    ),
    icon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset(
        AssetsHelper.IC_HOME,
      ),
    ),
  ),
  BottomNavigationBarItem(
    label: "Search",
    activeIcon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset(
        AssetsHelper.IC_SEARCH,
        color: AppColors.primaryElement,
      ),
    ),
    icon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset(
        AssetsHelper.IC_SEARCH,
      ),
    ),
  ),
  BottomNavigationBarItem(
    label: "Course",
    activeIcon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset(
        AssetsHelper.IC_COURSE,
        color: AppColors.primaryElement,
      ),
    ),
    icon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset(
        AssetsHelper.IC_COURSE,
      ),
    ),
  ),
  BottomNavigationBarItem(
    label: "Chat",
    activeIcon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset(
        AssetsHelper.IC_CHAT,
        color: AppColors.primaryElement,
      ),
    ),
    icon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset(
        AssetsHelper.IC_CHAT,
      ),
    ),
  ),
  BottomNavigationBarItem(
    label: "Profile",
    activeIcon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset(
        AssetsHelper.IC_PROFILE,
        color: AppColors.primaryElement,
      ),
    ),
    icon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset(
        AssetsHelper.IC_PROFILE,
      ),
    ),
  ),
];
