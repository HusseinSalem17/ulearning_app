import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udemy_app/common/routes/names.dart';
import 'package:udemy_app/common/values/colors.dart';
import 'package:udemy_app/common/values/constant_api.dart';
import 'package:udemy_app/global.dart';
import 'package:udemy_app/pages/welcome/bloc/welcome_blocs.dart';
import 'package:udemy_app/pages/welcome/bloc/welcome_events.dart';
import 'package:udemy_app/pages/welcome/bloc/welcome_states.dart';

import '../../common/values/assest_helper.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

// w OR h => for height or width, sp => for font
class _WelcomeState extends State<Welcome> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: BlocBuilder<WelcomeBloc, WelcomeState>(
          builder: (context, state) {
            return Container(
              margin: EdgeInsets.only(top: 34.h),
              width: 375.w,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  PageView(
                    controller: pageController,
                    onPageChanged: (index) {
                      state.page = index;
                      BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                    },
                    children: [
                      _page(
                        1,
                        context,
                        'next',
                        'First See Learning',
                        'Forget about a for of paper all knowledge in one learning',
                        AssetsHelper.IMG_READING,
                      ),
                      _page(
                        2,
                        context,
                        'next',
                        'Connect With Everyone',
                        "Always keep in touch with with your tutor & friend. let's get connected!",
                        AssetsHelper.IMG_BOY,
                      ),
                      _page(
                        3,
                        context,
                        'get started',
                        'Always Fascinated Learning',
                        'Anywhere, anytime. The time is at your discretion so study whenever you want',
                        AssetsHelper.IMG_MAN,
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 60.h,
                    child: DotsIndicator(
                      position: state.page,
                      dotsCount: 3,
                      mainAxisAlignment: MainAxisAlignment.center,
                      decorator: DotsDecorator(
                        color: AppColors.primaryThirdElementText,
                        activeColor: AppColors.primaryElement,
                        size: const Size.square(
                          8.0,
                        ),
                        activeSize: const Size(
                          18.0,
                          8.0,
                        ),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            5.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _page(
    int index,
    BuildContext context,
    String buttonName,
    String title,
    String subTitle,
    String imagePath,
  ) {
    return Column(
      children: [
        SizedBox(
          width: 345.w,
          height: 345.h,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.primaryText,
            fontSize: 24.sp,
            fontWeight: FontWeight.normal,
          ),
        ),
        Container(
          width: 375.w,
          padding: EdgeInsets.only(
            left: 30.w,
            right: 30.w,
          ),
          child: Text(
            subTitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primarySecondaryElementText,
              fontSize: 14.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            //within 0-2 index
            debugPrint('hussein');
            if (index < 3) {
              //animation
              debugPrint('hussein');
              pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn,
              );
            } else {
              //jump to a new page
              Global.storageService.setBool(
                AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME,
                true,
              );
              debugPrint(
                  'The value is ${Global.storageService.getDeviceFirstOpen()}');
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(AppRoutes.SIGN_IN, (route) => false);
            }
          },
          child: Container(
            margin: EdgeInsets.only(
              top: 100.h,
              left: 25.w,
              right: 25.w,
            ),
            width: 325.w,
            height: 50.h,
            decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  15.2,
                ),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(
                    0.1,
                  ),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(
                    0,
                    1,
                  ),
                ),
              ],
            ),
            child: Center(
              child: Text(
                buttonName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
