//for sliders view
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udemy_app/common/values/colors.dart';
import 'package:udemy_app/common/values/assest_helper.dart';
import 'package:udemy_app/pages/home/bloc/home_page_blocs.dart';
import 'package:udemy_app/pages/home/bloc/home_page_events.dart';
import 'package:udemy_app/pages/home/bloc/home_page_states.dart';

Widget sildersView(BuildContext context, HomePageStates state) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(top: 20.h, bottom: 8.h),
        width: 325.w,
        height: 200.h,
        child: PageView(
          onPageChanged: (value) {
            context.read<HomePageBlocs>().add(HomePageDots(value));
          },
          children: [
            _slidersCotainer(),
            _slidersCotainer(path: AssetsHelper.IC_IMAGE_1),
            _slidersCotainer(path: AssetsHelper.IC_IMAGE_2),
          ],
        ),
      ),
      DotsIndicator(
        dotsCount: 3,
        position: state.index,
        decorator: DotsDecorator(
          color: AppColors.primaryFourthElementText,
          activeColor: AppColors.primaryElement,
          size: const Size.square(5.0),
          activeSize: const Size(17.0, 5.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      )
    ],
  );
}

// sliders widget
Widget _slidersCotainer({String path = AssetsHelper.IC_ART}) {
  return Container(
    margin: EdgeInsets.only(top: 20.h, left: 8.w),
    width: 325.w,
    child: PageView(
      children: [
        Container(
          width: 325.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                path,
              ),
            ),
          ),
        )
      ],
    ),
  );
}
